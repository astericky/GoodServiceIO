//
//  LineList.swift
//  GoodService
//
//  Created by Chris Sanders on 9/15/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineBoroughList: View {
    @ObservedObject var viewModel: RoutesInfoViewModel
    
    var boroughs = [String]()
    var body: some View {
        NavigationView {
            List(content: content)
                .navigationBarTitle(Text("Boroughs"))
        }
    }
    
    init(viewModel: RoutesInfoViewModel) {
        self.viewModel = viewModel
        self.boroughs = self.viewModel.lines.map { $0.name }
    }
}

extension LineBoroughList {
    func content() -> some View {
        ForEach(viewModel.lines, id: \.self) { borough in
            NavigationLink(destination: LineList(viewModel: borough)) {
            Text(borough.name)
            }
        }
    }
}

//struct LineBoroughList_Previews: PreviewProvider {
//    static var previews: some View {
//        LineBoroughList()
//    }
//}
