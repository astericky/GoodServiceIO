//
//  Line.swift
//  GoodService
//
//  Created by Chris Sanders on 9/15/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct Line: Decodable, Hashable {
    let id: String
    let name: String
    let status: String
    let maxTravelTime: Double
    let routes: [LineRoute]
//    let north: [LineData]
//    let south: [LineData]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case maxTravelTime = "max_travel_time"
        case routes
    }
}
