//
//  InfoResponse.swift
//  GoodService
//
//  Created by Chris Sanders on 9/23/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation


struct InfoResponse: Codable {
  let timestamp: String
  let routes: [Route]
  let lines: [String: [Line]]
  
  struct Route: Codable {
    let id: String
    let name: String
    let status: String
    let alternateName: String?
    let color: String?
    let destinations: RouteDestinations
    let north: [RouteDirection]
    let south: [RouteDirection]
    var isFavorite = false
    
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
  
  struct RouteDestinations: Codable {
    let north: [String]
    let south: [String]
  }
  
  struct RouteDirection: Codable {
    let name: String
    let parentName: String
    let maxActualWait: Int?
    let maxScheduledWait: Int?
    let trafficCondition: Double?
    let delay: Int?
    
    enum CodingKeys: String, CodingKey {
      case name = "name"
      case parentName = "parent_name"
      case maxActualWait = "max_actual_headway"
      case maxScheduledWait =  "max_scheduled_headway"
      case trafficCondition = "travel_time"
      case delay
    }
  }
  
  struct Line: Codable {
    let id: String
    let name: String
    let status: String
    let maxTravelTime: Double
    let routes: [LineRoute]
    let north: [LineDirection]
    let south: [LineDirection]
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case status
      case maxTravelTime = "max_travel_time"
      case routes
      case north
      case south
    }
    
    struct LineDirection: Codable {
      let maxActualWait: Int?
      let maxScheduledWait: Int?
      let trafficCondition: Double?
      let delay: Int?
      
      enum CodingKeys: String, CodingKey {
        case maxActualWait = "max_actual_headway"
        case maxScheduledWait =  "max_scheduled_headway"
        case trafficCondition = "travel_time"
        case delay
      }
    }
  }
  
  struct LineRoute: Codable {
    var id: String
    var name: String
    var color: String
  }
}
