//
//  RouteList.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteList: View {
    @State var isLoading = false
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
        .blur(radius: self.viewModel.routes.isEmpty ? 10 : 0)
    }
    
    func content() -> some View {
        ForEach(viewModel.routes, content: RouteRow.init(viewModel:))
    }
}


//struct RouteList_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteList()
//    }
//}

