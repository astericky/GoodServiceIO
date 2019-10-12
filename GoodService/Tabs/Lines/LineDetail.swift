//
//  LineDetail.swift
//  GoodService
//
//  Created by Chris Sanders on 9/16/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineDetail: View {
    var viewModel: LineRowViewModel
    var body: some View {
        VStack(alignment: .leading) {
            header
            statusBar
            Spacer()
        }
    }
    
    init(viewModel: LineRowViewModel) {
        self.viewModel = viewModel
    }
}

extension LineDetail {
    var header: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.title)
                    .fontWeight(.bold)
                RouteHList(routes: viewModel.routes)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
    var statusBar: some View {
        StatusBar(status: viewModel.status, color: viewModel.statusColor)
            .padding(.vertical, 20)
    }
}

struct LineDetail_Previews: PreviewProvider {
    static var previews: some View {
        LineDetail(viewModel: LineRowViewModel(item: routesInfo.lines["Manhattan"]![0]))
    }
}

