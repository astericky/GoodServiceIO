//
//  LineDetail.swift
//  GoodService
//
//  Created by Chris Sanders on 9/16/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineDetail: View {
    var line: Line
    var body: some View {
        Text("Hello World!")
    }
}

struct LineDetail_Previews: PreviewProvider {
    static var previews: some View {
        LineDetail(line: routesInfo.lines["Manhattan"]![0])
    }
}
