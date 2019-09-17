//
//  LineRow.swift
//  GoodService
//
//  Created by Chris Sanders on 9/15/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineList: View {
    var lines: [Line]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LineRow_Previews: PreviewProvider {
    static var previews: some View {
        LineList(lines: routesInfo.lines["Manhattan"]!)
    }
}
