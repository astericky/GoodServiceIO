//
//  LineBoroughViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 10/1/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//
//
import Foundation

struct LineBoroughViewModel: Identifiable {
    private var boroughName: String
    private var boroughLines: [LineRowViewModel]
    
    var id: String {
        boroughName
    }

    var name: String {
        boroughName
    }
    
    var lines: [LineRowViewModel] {
        boroughLines
    }
    
    init(name: String, lines: [LineRowViewModel]) {
        self.boroughName = name
        self.boroughLines = lines
    }
}

// Used to conform to the protocal Hashable with gives one the ability to
// differentiate between one item compared to another item
extension LineBoroughViewModel: Hashable {
    static func == (lhs: LineBoroughViewModel, rhs: LineBoroughViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
