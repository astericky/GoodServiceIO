//
//  Route.swift
//  GoodServiceIO
//
//  Created by Chris Sanders on 6/6/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation
import SwiftUI

struct Route: Decodable, Hashable, Identifiable {
    let id: String
    let name: String
    let status: String
    let alternateName: String?
    let color: String?
    let destinations: RouteDestinations
    let north: [RouteDirection]
    let south: [RouteDirection]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case alternateName = "alternate_name"
        case color
        case destinations
        case north
        case south
    }
}
