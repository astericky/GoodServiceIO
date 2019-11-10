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
        VStack(alignment: .leading) {
            HStack {
                Text("Delay")
                Text("\(viewModel.delay)")
                Spacer()
            }
            HStack {
                Text("Actual Wait")
                Text("\(viewModel.maxActualWait) minutes")
                Spacer()
            }
            HStack {
                Text("Scheduled Wait")
                Text("\(viewModel.maxScheduledWait) minutes")
                Spacer()
            }
            HStack {
                Text("Traffic Condition")
                Text("\(viewModel.trafficCondition)%")
                Spacer()
            }
        }
        .padding()
    }
}

//struct LineDirectionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        LineDirectionRow()
//    }
//}
