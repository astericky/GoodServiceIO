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
        }
    }
    
    init(viewModel: RoutesInfoViewModel) {
        self.viewModel = viewModel
    }
}

private extension RouteList {
    var routesTable: some View {
        NavigationView {
            List(content: content)
                .navigationBarTitle(Text("Trains"))
                .navigationBarItems(trailing: HStack {
                    Button(action: {
                        self.viewModel.fetchRoutesInfo()
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                    })
                    Text("Last Update: \(viewModel.datetime)")
                        .font(.caption)
                })
        }
    }
    
    func content() -> some View {
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

