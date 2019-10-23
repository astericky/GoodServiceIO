//
//  LineRow.swift
//  GoodService
//
//  Created by Chris Sanders on 9/17/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineRow: View {
    var viewModel: LineRowViewModel
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.name)
                Spacer()
            }
            Spacer()
            HStack(alignment: .bottom) {
                ForEach(viewModel.routes, id: \.self) { route in
                    Text(route.name)
                        .foregroundColor(.white)
                        .frame(width: 25, height:25)
                        .background(route.color)
                        .clipShape(Circle())
                        .minimumScaleFactor(0.01)
                }
                Spacer()
                Text(viewModel.status)
                    .font(.caption)
            }
            .padding(0)
        }
        .padding(10)
    }
    
    init(viewModel: LineRowViewModel) {
        self.viewModel = viewModel
    }
}

struct LineRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineRow(viewModel: LineRowViewModel(item: routesInfo.lines["Manhattan"]![0]))
                .previewLayout(.fixed(width: 320, height: 90))

            LineRow(viewModel: LineRowViewModel(item: routesInfo.lines["Manhattan"]![1]))
                .previewLayout(.fixed(width: 320, height: 90))

            LineRow(viewModel: LineRowViewModel(item: routesInfo.lines["Manhattan"]![2]))
                .previewLayout(.fixed(width: 320, height: 90))
        }
    }
}
