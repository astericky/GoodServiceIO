//
//  LineRouteViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 10/1/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineRouteRowViewModel: Identifiable  {
    var item: InfoResponse.LineRoute
    
    var id: String {
        item.id
    }
    
    var name: String {
        item.name
    }
    
    var color: Color {
        Color.createBackground(from: item.color)
    }
    
    init(item: InfoResponse.LineRoute)  {
        self.item = item
    }
}

// Used to conform to the protocal Hashable with gives one the ability to
// differentiate between one item compared to another item
extension LineRouteRowViewModel: Hashable {
    static func == (lhs: LineRouteRowViewModel, rhs: LineRouteRowViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
