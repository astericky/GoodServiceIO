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
            Text("Modal RouteDetailRouteMap")
        }
    }
    
    init(routeName: String) {
        self.routeName = routeName
        
        if let northRoute = routeMaps.routes[routeName]?.routings["north"]?[0],
            let southRoute = routeMaps.routes[routeName]?.routings["south"]?[0] {
            
            self.northRoute = northRoute
            northRoute.forEach {
                if let stop = routeMaps.stops[$0] {
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
