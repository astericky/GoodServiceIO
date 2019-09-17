//
//  RoutesViewModel.swift
//  GoodServiceIO
//
//  Created by Chris Sanders on 6/6/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Combine
import SwiftUI

final class RoutesInfoViewModel: ObservableObject {
    @Published var routes = routesInfo.routes
    @Published var lines = routesInfo.lines
    
    init() {
        fetchRoutes()
    }

    func fetchRoutes() {
        RouteService().getRouteInfo() {
            self.routes = $0.routes
            self.lines = $0.lines
        }
    }
}
