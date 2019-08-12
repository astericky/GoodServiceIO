//
//  RouteMaps.swift
//  GoodService
//
//  Created by Chris Sanders on 7/27/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteMaps: Decodable {
    let routes: [String: RouteMapRoute]
    let stops: [String: RouteMapStop]
}
