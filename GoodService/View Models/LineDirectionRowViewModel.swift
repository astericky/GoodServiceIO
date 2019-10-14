//
//  LineDirectionRowViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 10/12/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct LineDirectionRowViewModel {
    
    private var item: InfoResponse.Line.LineDirection
    
    var maxActualWait: Int {
        item.maxActualWait ?? 0
    }
    
    var maxScheduledWait: Int {
        item.maxScheduledWait ?? 0
    }
    
    var trafficCondition: Double {
        item.trafficCondition ?? 0
    }
    
    var delay: Int {
        item.delay ?? 0
    }
    
    init(item: InfoResponse.Line.LineDirection)  {
        self.item = item
    }
}

// TODO: Need to conform to Hashable but this needs to be updated somehow
extension LineDirectionRowViewModel: Hashable {
    static func == (lhs: LineDirectionRowViewModel, rhs: LineDirectionRowViewModel) -> Bool {
        return lhs.delay == rhs.delay
            && lhs.maxActualWait == rhs.maxActualWait
            && lhs.maxScheduledWait == rhs.maxScheduledWait
            && lhs.trafficCondition ==  rhs.trafficCondition
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.delay)
    }
}
