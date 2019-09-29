//
//  RouteDirectionRow.swift
//  GoodService
//
//  Created by Chris Sanders on 9/28/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteDirectionRow: View {
    private var routeDirection: RouteDirectionRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(routeDirection.name)
                    .font(.headline)
                Spacer()
            }
            
            HStack {
                Text("Actual Max Wait:")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("\(routeDirection.maxActualWait) minutes")
                    .font(.caption)
            }
            
            HStack {
                Text("Scheduled Max Wait:")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("\(routeDirection.maxActualWait) minutes")
                    .font(.caption)
            }
            
            HStack {
                Text("Traffic Conditions:")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("\(self.convertDecimalToPercentString(number: routeDirection.trafficCondition))")
                    .font(.caption)
            }
        }
        .padding(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
    
    init(viewModel: RouteDirectionRowViewModel) {
        self.routeDirection = viewModel
    }
}

extension RouteDirectionRow {
    func convertDecimalToPercentString(number: Double) -> String {
        "\((number * 100).format(f: 2))%"
    }
}

//struct RouteDirectionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteDirectionRow()
//    }
//}
