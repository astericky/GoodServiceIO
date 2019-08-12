//
//  RouteMapsViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 7/27/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

final class RouteMapsViewModel: ObservableObject {
    @Published var routes = routeMapInfo.routes
    @Published var stops = routeMapInfo.stops
    
    init() {
        fetchMaps()
    }
    
    func fetchMaps() {
        RouteService().getRouteMaps {
            self.routes = $0.routes
            self.stops = $0.stops
        }
    }
}
