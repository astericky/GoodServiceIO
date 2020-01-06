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
        Text("Delay: ")
          .font(.caption)
          .fontWeight(.bold)
        Text("\(viewModel.delay) minutes")
          .font(.caption)
        Spacer()
      }
      HStack {
        Text("Actual Wait")
          .font(.caption)
          .fontWeight(.bold)
        Text("\(viewModel.maxActualWait) minutes")
          .font(.caption)
        Spacer()
      }
      HStack {
        Text("Scheduled Wait")
          .font(.caption)
          .fontWeight(.bold)
        Text("\(viewModel.maxScheduledWait) minutes")
          .font(.caption)
        Spacer()
      }
      HStack {
        Text("Traffic Condition")
          .font(.caption)
          .fontWeight(.bold)
        Text("\(viewModel.trafficCondition)%")
          .font(.caption)
        Spacer()
      }
    }
    .padding()
  }
}

struct LineDirectionRow_Previews: PreviewProvider {
    static var previews: some View {
      let item = routesInfo.lines["The Bronx"]![0].north[0]
      return LineDirectionRow(viewModel:
        LineDirectionRowViewModel(item: item)
      )
      .previewLayout(.sizeThatFits)
    }
}
