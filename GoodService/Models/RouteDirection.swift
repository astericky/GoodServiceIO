//
//  RouteDirection.swift
//  GoodServiceIO
//
//  Created by Chris Sanders on 6/8/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//
//    "name": "7 Avenue Local",
//    "parent_name": "7 Avenue",
//    "boroughs": [
//    "Manhattan"
//    ],
//    "max_actual_headway": 8,
//    "max_scheduled_headway": 8,
//    "delay": 0,
//    "travel_time": 0.12993197278911564

import Foundation

struct RouteDirection: Decodable, Hashable {
    let name: String
    let parentName: String
    let maxActualWait: Int?
    let maxScheduledWait: Int?
    let trafficCondition: Double?
    let delay: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case parentName = "parent_name"
        case maxActualWait = "max_actual_headway"
        case maxScheduledWait =  "max_scheduled_headway"
        case trafficCondition = "travel_time"
        case delay
    }
}
