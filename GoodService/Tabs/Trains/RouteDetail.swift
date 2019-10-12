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
    
    private var route: RouteRowViewModel
    
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
            RouteDetailRouteMap(routeName: self.route.name)
        }
    }
        
    init(route: RouteRowViewModel) {
        self.route = route
    }
}



//struct RouteDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteDetail(route: routesInfo.routes[8])
//    }
//}



