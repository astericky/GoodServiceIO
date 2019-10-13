//
//  LineDirectionTable.swift
//  GoodService
//
//  Created by Chris Sanders on 10/12/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineDirectionTable: View {
    var name: String
    var directionList: [LineDirectionRowViewModel]

    var body: some View {
        Text(name)
    }
    
    init(
        name: String,
        directionList: [InfoResponse.Line.LineDirection]
    )  {
        self.name = name
        self.directionList = directionList.map { LineDirectionRowViewModel(item: $0) }
    }
}

//struct LineDirectionTable_Previews: PreviewProvider {
//    static var previews: some View {
//        LineDirectionTable()
//    }
//}
