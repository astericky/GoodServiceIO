//
//  RouteDetailRouteMap.swift
//  GoodService
//
//  Created by Chris Sanders on 8/18/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//
//
//import SwiftUI
//
//struct RouteDetailRouteMap: View {
//    @Environment(\.presentationMode) var presentation
//    @ObservedObject var routeMaps = RouteMapsViewModel()
//    
//    var routeName: String
//    var routeBackgroundColor =  Color(red: 0.0, green: 0.0, blue: 0.0)
//    var northRoute = [String]()
//    var southRoute = [String]()
//    var stops = [RouteMapStop]()
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text(routeName)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(
//                        width: 50,
//                        height: 50
//                    )
//                    .background(routeBackgroundColor)
//                    .clipShape(Circle())
//            }
//            .padding()
//            ScrollView() {
//                VStack(spacing: 0) {
//                    ForEach(stops, id: \.id) { stop in
//                        HStack() {
//                            ZStack {
//                                Rectangle()
//                                    .fill(self.routeBackgroundColor)
//                                    .frame(width: 12, height: 32)
//                                Circle()
//                                    .fill(Color.white)
//                                    .frame(width: 6, height: 6)
//                            }
//
//                            Text(stop.name)
//                                .font(.caption)
//                            Spacer()
//                        }
//                    }
//                    .padding(.init(top: 0, leading: 48, bottom: 0, trailing: 48))
//                }
//            }
//            
//        }
//    }
//    
//    init(routeName: String) {
//        self.routeName = routeName
//        
//        if let route = routeMaps.routes[routeName] {
//            self.routeBackgroundColor = Color.createBackground(from: route.color)
//            
//            if let northRoute = route.routings["north"]?[0],
//                let southRoute = route.routings["south"]?[0] {
//                
//                self.northRoute = northRoute
//                northRoute.forEach { routeItem in
//                    var route = routeItem
//                    route.removeLast()
//                    if let stop = routeMaps.stops[route] {
//                        stops.append(stop)
//                    }
//                }
//            }
//        }
//        
//    }
//}
//
//#if DEBUG
//struct RouteDetailRouteMap_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteDetailRouteMap(routeName: "1")
//    }
//}
//#endif
