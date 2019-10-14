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
        VStack {
            tableHeader
            Divider()
            ForEach(directionList, id: \.self, content: LineDirectionRow.init(viewModel:))
        }
    }
    
    init(
        name: String,
        directionList: [InfoResponse.Line.LineDirection]
    )  {
        self.name = name
        self.directionList = directionList.map { LineDirectionRowViewModel(item: $0) }
    }
}

extension LineDirectionTable {
    var tableHeader: some View {
        Text(name)
            .font(.headline)
            .padding(.top, 20)
    }
}

//struct LineDirectionTable_Previews: PreviewProvider {
//    static var previews: some View {
//        LineDirectionTable()
//    }
//}
