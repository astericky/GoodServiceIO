//
//  RouteMapRoute.swift
//  GoodService
//
//  Created by Chris Sanders on 8/10/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteMapRoute: Decodable {
    let id: String
    let name: String
    let color: String
    let destinations: [String: [String]]
    let routings: [String: [[String]]]
}
