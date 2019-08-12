//
//  RouteDestinations.swift
//  GoodServiceIO
//
//  Created by Chris Sanders on 6/9/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteDestinations: Decodable, Hashable {
    let north: [String]
    let south: [String]
}
