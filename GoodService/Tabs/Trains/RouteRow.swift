//
//  RouteRow.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
// 

import SwiftUI

struct RouteRow: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(
    entity: FavoriteRoutes.entity(),
    sortDescriptors: [
      NSSortDescriptor(keyPath: \FavoriteRoutes.name, ascending: true)
    ]
  ) var favoriteRoutes: FetchedResults<FavoriteRoutes>
  
  private let route: RouteRowViewModel
  private var isFavorite: Bool {
    favoriteRoutes.contains(where: { $0.id == route.id })
  }
  
  var body: some View {
    NavigationLink(destination: RouteDetail(route: route)) {
      VStack(alignment: .leading) {
        ZStack(alignment: .bottom) {
          HStack(alignment: .top) {
            routeName
            routeAlternateName
            Spacer()
          }
          
          HStack(alignment: .bottom) {
            Spacer()
            VStack(alignment: .trailing) {
              isFavoriteButton
              routeStatus
            }
          }
        }
      }
      .padding(10)
    }
  }
  
  init(viewModel: RouteRowViewModel) {
    self.route = viewModel
  }
}

private extension RouteRow {
  var routeName: some View {
    Text(route.name)
      .font(.callout)
      .fontWeight(.semibold)
      .foregroundColor(.white)
      .frame(width: 50.0, height: 50.0)
      .background(route.color)
      .clipShape(Circle())
  }
  
  var routeAlternateName: some View {
    Text(route.alternateName)
      .font(.footnote)
  }
  
  var routeStatus: some View {
    Text(route.status)
      .font(.caption)
  }
  
  var isFavoriteButton: some View {
    Image(systemName: self.isFavorite ? "star.fill" : "star")
      .resizable()
      .frame(width: 20, height: 20)
      .foregroundColor((self.isFavorite ? .yellow : .defaultGray))
  }
}

#if DEBUG
struct RouteRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      RouteRow(viewModel: RouteRowViewModel(item: routesInfo.routes[23]))
        .previewLayout(.fixed(width: 320, height: 90))
      
      RouteRow(viewModel: RouteRowViewModel(item: routesInfo.routes[8]))
        .previewLayout(.fixed(width: 320, height: 90))
      
      RouteRow(viewModel: RouteRowViewModel(item: routesInfo.routes[11]))
        .previewLayout(.fixed(width: 320, height: 90))
    }
  }
}
#endif
