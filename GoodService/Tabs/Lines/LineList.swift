//
//  LineRow.swift
//  GoodService
//
//  Created by Chris Sanders on 9/15/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineList: View {
    var viewModel: LineBoroughViewModel
    
    var body: some View {
        List(viewModel.lines, id: \.self) { line in
            NavigationLink(destination: LineDetail(viewModel: line)) {
                LineRow(viewModel: line)
            }
        }
        .navigationBarTitle(Text(viewModel.name))
    }
    
    init(viewModel: LineBoroughViewModel) {
        self.viewModel = viewModel
    }
}

extension LineList {
//    func content() -> {
//        ForEach(viewModel.)
//    }
}

let items = routesInfo.lines["Manhattan"]!.map {
    LineRowViewModel(item: $0)
}

struct LineList_Previews: PreviewProvider {
    static var previews: some View {
        LineList(viewModel: LineBoroughViewModel(name: "Manhattan", lines: items))
    }
}
