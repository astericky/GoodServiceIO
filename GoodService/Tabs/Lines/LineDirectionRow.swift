//
//  LineDirectionRow.swift
//  GoodService
//
//  Created by Chris Sanders on 10/12/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineDirectionRow: View {
    var viewModel: LineDirectionRowViewModel
    
    var body: some View {
        Text("Hello World!")
    }
    
    init(viewModel: LineDirectionRowViewModel) {
        self.viewModel = viewModel
    }
}

//struct LineDirectionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        LineDirectionRow()
//    }
//}
