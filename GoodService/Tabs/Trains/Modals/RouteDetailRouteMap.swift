//
//  RouteDetailRouteMap.swift
//  GoodService
//
//  Created by Chris Sanders on 8/18/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteDetailRouteMap: View {
  @Environment(\.presentationMode) var presentation
  @ObservedObject var routeMapsInfo: RouteDetailRouteMapViewModel
  
  var routeName: String
  var routeBackgroundColor =  Color(red: 0.0, green: 0.0, blue: 0.0)
  var northRoute = [String]()
  var southRoute = [String]()
  
  var body: some View {
    VStack {
      header
      ScrollView() {
        VStack(spacing: 0) {
          ForEach(self.routeMapsInfo.stops, id: \.id) { stop in
            HStack() {
              ZStack {
                Rectangle()
                  .fill(self.routeMapsInfo.routeBackgroundColor)
                  .frame(width: 12, height: 32)
                Circle()
                  .fill(Color.white)
                  .frame(width: 6, height: 6)
              }

              Text(stop.name)
                .font(.caption)
              Spacer()
            }.padding(.init(top: 0, leading: 48, bottom: 0, trailing: 48))
          }
        }
      }
    }
  }
  
  init(id: String, routeName: String) {
    self.routeName = routeName
    self.routeMapsInfo = RouteDetailRouteMapViewModel(
      id: id,
      name: routeName,
      goodServiceFetcher: GoodServiceFetcher()
    )
  }
}

extension RouteDetailRouteMap {
  var header: some View {
    HStack {
      Text(routeName)
        .foregroundColor(.white)
        .padding()
        .frame(
          width: 50,
          height: 50
      )
        .background(routeMapsInfo.routeBackgroundColor)
        .clipShape(Circle())
        .minimumScaleFactor(0.01)
    }
    .padding()
  }
}

#if DEBUG
struct RouteDetailRouteMap_Previews: PreviewProvider {
  static var previews: some View {
    RouteDetailRouteMap(id: "1", routeName: "1")
  }
}
#endif
