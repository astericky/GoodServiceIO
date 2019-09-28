//
//  LineRowViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 9/26/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct LineRowViewModel: Identifiable {
    private let item: InfoResponse.Line
    
    var id: String {
        return item.id
    }
    
    var name: String {
        return item.name
    }
    
    var routes: [InfoResponse.LineRoute] {
        return item.routes
    }
    
    init(item: InfoResponse.Line) {
        self.item = item
    }
}
