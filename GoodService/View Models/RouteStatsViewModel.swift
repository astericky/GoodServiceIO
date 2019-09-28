//
//  RouteStatsViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 7/27/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//
//
//import Combine
//import SwiftUI
//
//final class RouteStatsViewModel: ObservableObject {
//    @Published var status = statsInfo.status
//    
//    init() {
//        fetchRoutes()
//    }
//    
//    func fetchRoutes() {
//        RouteService().getRouteStats() {
//            self.status = $0.status
//        }
//    }
//}
