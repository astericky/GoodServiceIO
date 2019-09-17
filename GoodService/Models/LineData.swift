//
//  LineData.swift
//  GoodService
//
//  Created by Chris Sanders on 9/15/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct LineData: Decodable {
    let type: String
    let name: String
    let maxActualWait: Int?
    let maxScheduledWait: Int?
    let trafficCondition: Double?
    
    enum CodingKeys: String, CodingKey {
        case type
        case name
        case maxActualWait = "max_actual_headway"
        case maxScheduledWait =  "max_scheduled_headway"
        case trafficCondition = "travel_time"
    }
}
