//
//  RouteList.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteList: View {
    @ObservedObject var viewModel: RoutesInfoViewModel
    
    var body: some View {
        NavigationView {
            List(content: content)
                .navigationBarTitle(Text("Trains"))
        }
    }
    
    init(viewModel: RoutesInfoViewModel) {
        self.viewModel = viewModel
    }
}

private extension RouteList {
    func content() -> some View {
        ForEach(viewModel.routes, content: RouteRow.init(viewModel:))
    }

    var loading: some View {
        Text("Loading...")
            .foregroundColor(.gray)
    }
}

#if DEBUG
//struct RouteList_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteList()
//    }
//}
#endif
