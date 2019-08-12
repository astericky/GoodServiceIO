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
    
    init() {
        fetchRoutes()
    }

    func fetchRoutes() {
        RouteService().getRouteInfo() {
            self.routes = $0.routes
        }
    }
}
