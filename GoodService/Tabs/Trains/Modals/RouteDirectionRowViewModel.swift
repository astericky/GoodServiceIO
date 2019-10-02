//
//  RouteDirectionRowViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 9/28/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteDirectionRowViewModel: Identifiable {
    private var item: InfoResponse.RouteDirection
    
    var id: String {
        item.name
    }
    
    var name: String {
        item.name
    }
    
    var parentName: String {
        item.parentName
    }
    
    var maxActualWait: Int {
        item.maxActualWait ?? 0
    }
    
    var maxScheduledWait: Int {
        item.maxScheduledWait ?? 0
    }
    var trafficCondition: Double {
        item.trafficCondition ?? 0.0
    }
    
    var delay: Int {
        item.delay ?? 0
    }
    
    init(item: InfoResponse.RouteDirection) {
        self.item =  item
    }
}

extension RouteDirectionRowViewModel: Hashable {
    static func == (lhs: RouteDirectionRowViewModel, rhs: RouteDirectionRowViewModel) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}
