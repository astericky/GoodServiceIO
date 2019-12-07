//
//  RouteDetail.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Combine
import SwiftUI

struct RouteDetail: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(
    entity: FavoriteRoutes.entity(),
    sortDescriptors: [
      NSSortDescriptor(keyPath: \FavoriteRoutes.name, ascending: true)
    ]
  ) var favoriteRoutes: FetchedResults<FavoriteRoutes>
  
  @State private var showModal = false
  
  private var route: RouteRowViewModel
  private var isFavorite: Bool {
    favoriteRoutes.contains(where: { $0.id == route.id })
  }
  
  var body: some View {
    ScrollView {
      ZStack(alignment: .bottom) {
        HStack(alignment: .top) {
          Text(route.name)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(
              width: 100,
              height: 100
          )
            .background(route.color)
            .clipShape(Circle())
          Text(route.alternateName)
            .font(.caption)
          HStack {
            isFavoriteButton
          }
          .padding(.all, 0)
          .padding(.top, 10)
          Spacer()
        }
        .padding(.init(top: -10, leading: 16, bottom: 16, trailing: 16))
        
        HStack(alignment: .bottom) {
          Spacer()
          Button("Route Map") {
            self.showModal.toggle()
          }
        }
        .padding(.trailing, 16)
      }
      
      StatusBar(status: route.status, color: route.statusColor)
      
      RouteDirectionTable(name: "South", routeDirectionList: route.south)
      RouteDirectionTable(name: "North", routeDirectionList: route.north)
    }
    .sheet(isPresented: $showModal) {
      RouteDetailRouteMap(id: self.route.id, routeName: self.route.name)
    }
  }
  
  init(route: RouteRowViewModel) {
    self.route = route
  }
}

extension RouteDetail {
  var isFavoriteButton: some View {
    Button(action: {
      // TODO: Add check if it is already a favorite
      // if it is remove it from favorites
      // if it is not a favorite add it to favorites
      if self.isFavorite {
        let favoriteIndex = self.favoriteRoutes.firstIndex(where: { $0.id == self.route.id })
        if let hasFavoriteIndex = favoriteIndex {
          let favorite = self.favoriteRoutes[hasFavoriteIndex]
          
          self.moc.delete(favorite)
          
          try? self.moc.save()
        }
      } else {
        let newFavorite = FavoriteRoutes(context: self.moc)
        newFavorite.id = self.route.id
        newFavorite.name = self.route.name
        newFavorite.alternateName = self.route.alternateName
        newFavorite.color = self.route.colorHex
        newFavorite.status  = self.route.status
        
        try? self.moc.save()
      }
    }, label: {
      HStack {
        Image(systemName: self.isFavorite ? "star.fill" : "star")
          .resizable()
          .frame(width: 20, height: 20)
          .foregroundColor((self.isFavorite ? .yellow : .gray))
      }
    })
  }}



struct RouteDetail_Previews: PreviewProvider {
  static var previews: some View {
    RouteDetail(route: RouteRowViewModel(item: routesInfo.routes[8]))
  }
}



