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
    @ObservedObject var routeMaps = RouteMapsViewModel()
    
    var routeName: String
    var northRoute = [String]()
    var stops = [RouteMapStop]()
    
    
    var body: some View {
        VStack {
            HStack {
                Text(routeName)
            }
            ScrollView {
                ForEach(stops, id: \.id) { stop in
                    VStack(alignment: .leading) {
                        HStack {
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 25, height: 50)
                            Text(stop.name)
                            Spacer()
                        }
                    }.padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
            }
        }
    }
    
    init(routeName: String) {
        self.routeName = routeName
        
        if let northRoute = routeMaps.routes[routeName]?.routings["north"]?[0],
            let southRoute = routeMaps.routes[routeName]?.routings["south"]?[0] {
            
            self.northRoute = northRoute
            northRoute.forEach { routeItem in
                var route = routeItem
                route.removeLast()
                if let stop = routeMaps.stops[route] {
                    stops.append(stop)
                }
            }
        }
    }
}

#if DEBUG
struct RouteDetailRouteMap_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailRouteMap(routeName: "1")
    }
}
#endif
