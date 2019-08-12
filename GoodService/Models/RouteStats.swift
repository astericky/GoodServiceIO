//
//  RouteStats.swift
//  GoodService
//
//  Created by Chris Sanders on 7/27/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteStats: Decodable {
    let timestamp: String
    let status: [String: RouteStatus]
}
