//
//  ContentView.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: RoutesInfoViewModel
    
    var body: some View {
        ZStack {
            TabView() {
                RouteList(viewModel: viewModel)
                    .tabItem {
                        Image("subway")
                        Text("Trains")
                    }.tag(0)
                
                LineBoroughList(viewModel: viewModel)
                    .tabItem {
                        Image("railway")
                        Text("Lines")
                    }.tag(1)
                
                SlowZoneList(viewModel: viewModel)
                    .tabItem {
                        Image("problem")
                        Text("Slow Zones")
                    }.tag(2)
                
                FavoriteList()
                    .tabItem {
                        Image(systemName: "star")
                        Text("Favorites")
                    }.tag(3)
            }.blur(radius: viewModel.routes.isEmpty ? 10 : 0)
            
            if viewModel.routes.isEmpty {
                loading
            }
        }
    }
    
    init(viewModel: RoutesInfoViewModel) {
        self.viewModel = viewModel
    }
}

private extension ContentView {
    var loading: some View {
        Text("Loading...")
            .foregroundColor(.gray)
    }
}

//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
