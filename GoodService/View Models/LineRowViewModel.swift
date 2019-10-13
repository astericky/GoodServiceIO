//
//  LineRowViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 9/26/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineRowViewModel: Identifiable {
    private var item: InfoResponse.Line
    
     var id: String {
        return item.id
    }
    
    var name: String {
        return item.name
    }
    
    var routes: [LineRouteRowViewModel] {
        return item.routes.map(LineRouteRowViewModel.init(item:))
    }
    
    var north: [InfoResponse.Line.LineDirection] {
        return item.north
    }
    
    var south: [InfoResponse.Line.LineDirection] {
        return item.south
    }
    
    var maxTravelTime: Double {
        item.maxTravelTime
    }
    
    var status: String {
        item.status
    }
    
    var statusColor: Color {
        switch self.item.status {
        case "Good Service":
            return Color("color-good-service")
//            return Color.goodService
        case "Not Good":
//            return Color.notGoodService
            return Color("color-not-good-service")
        case "Service Change":
//            return Color.serviceChange
            return Color("color-service-change")
        case "Delay":
//            return Color.delayedService
            return Color("color-delayed-service")
        case "Not Scheduled":
            fallthrough
        default:
//            return Color.noService
            return Color("color-no-service")
        }
    }
    
    init(item: InfoResponse.Line) {
        self.item = item
    }
}

// Used to conform to the protocal Hashable with gives one the ability to
// differentiate between one item compared to another item
extension LineRowViewModel: Hashable {
    static func == (lhs: LineRowViewModel, rhs: LineRowViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
