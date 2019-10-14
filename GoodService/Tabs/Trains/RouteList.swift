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
        ZStack {
            routesTable
            if viewModel.routes.isEmpty {
                loading
            }
        }
    }
    
    init(viewModel: RoutesInfoViewModel) {
        self.viewModel = viewModel
    }
}

private extension RouteList {
    var loading: some View {
        Text("Loading...")
            .foregroundColor(.gray)
    }
    
    var routesTable: some View {
        NavigationView {
            List(content: content)
                .navigationBarTitle(Text("Trains"))
        }
        .blur(radius: viewModel.routes.isEmpty ? 10 : 0)
    }
    
    func content() -> some View {
        //        ForEach(viewModel.routes, content: RouteRow.init(viewModel:))
        ForEach(viewModel.routes, id: \.self) { route in
            self.selectView(for: route)
        }
    }
    
    func selectView(for viewModel: RouteRowViewModel) -> some View {
        if (viewModel.status == "No Service"
            || viewModel.status == "Not Scheduled")  {
            return AnyView(RouteNoServiceRow(viewModel: viewModel))
        } else {
            return AnyView(
                RouteRow(viewModel: viewModel)
            )
        }
    }
}


//struct RouteList_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteList()
//    }
//}

