//
//  RoutesRowViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 9/26/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteRowViewModel: Identifiable  {
    private let item: InfoResponse.Route
    
    var id: String {
        return item.id
    }
    
    var name: String {
        return item.name
    }
    
    var alternateName: String {
        return item.alternateName ?? ""
    }
    
    var color: String {
        return item.color ?? ""
    }
    
    var status: String {
        return item.status
    }
    
    var north: [InfoResponse.RouteDirection] {
        item.north
    }
    
    var south: [InfoResponse.RouteDirection] {
        item.south
    }
    
    init(item: InfoResponse.Route)  {
        self.item = item
    }
}

// Used to conform to the protocal Hashable with gives one the ability to
// differentiate between one item compared to another item
extension RouteRowViewModel: Hashable {
    static func == (lhs: RouteRowViewModel, rhs: RouteRowViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}
