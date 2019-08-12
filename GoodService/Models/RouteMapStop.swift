//
//  RouteMapStop.swift
//  GoodService
//
//  Created by Chris Sanders on 8/10/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteMapStop: Decodable {
    let id: String
    let name: String
    let trains: [RouteMapStopRoute]
}
