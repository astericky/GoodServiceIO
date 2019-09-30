//
//  RouteMapsViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 7/27/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI
import Combine

final class RouteDetailRouteMapViewModel: ObservableObject {
//    @Published var routes = [String: RouteMapsResponse.Route]()
//    @Published var stops = [String: RouteMapsResponse.Stop]()
    
    @Published var routeMapsInfo: RouteMapsResponse?
    
    var name: String
    
    var route: RouteMapsResponse.Route? {
        routeMapsInfo?.routes[self.name]
    }
    
    var routeBackgroundColor: Color {
        Color.createBackground(from: route?.color ?? "")
    }
    
    var stops: [RouteMapsResponse.Stop] {
        var stops = [RouteMapsResponse.Stop]()
        if let northRoute = route?.routings["north"]?[0],
            let southRoute = route?.routings["south"]?[0] {
            
            northRoute.forEach { routeItem in
                var route = routeItem
                route.removeLast()
                if let stop = routeMapsInfo?.stops[route] {
                    stops.append(stop)
                }
            }
        }
        return stops
    }
    
    private var goodServiceFetcher: GoodServiceFetcher
    private var disposables = Set<AnyCancellable>()
    
    init(
        name: String,
        goodServiceFetcher: GoodServiceFetcher,
        scheduler: DispatchQueue = DispatchQueue(label: "RouteDetailRouteMapViewModel")
    ) {
        self.goodServiceFetcher = goodServiceFetcher
        self.name = name
        self.fetchMapInfo()
    }
    
    func fetchMapInfo() {
        goodServiceFetcher.getMaps()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.routeMapsInfo = nil
                        break
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] routeMapInfo in
                    guard let self = self else { return }
                    self.routeMapsInfo = routeMapInfo
            })
            .store(in: &disposables)
    }
}

