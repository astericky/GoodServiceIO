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
  @State private var showModal = false
  
  var route: RouteRowViewModel
  
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
            isFavorite
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
}

extension RouteDetail {
  var isFavorite: some View {
    Image(systemName: route.isFavorite ? "star" : "star.fill")
      .resizable()
      .frame(width: 30, height: 30)
      .foregroundColor((route.isFavorite ? .gray : .yellow))
  }
}



struct RouteDetail_Previews: PreviewProvider {
  static var previews: some View {
    RouteDetail(route: RouteRowViewModel(item: routesInfo.routes[8]))
  }
}



