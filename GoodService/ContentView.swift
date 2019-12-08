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
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(
    entity: FavoriteRoutes.entity(),
    sortDescriptors: [
      NSSortDescriptor(keyPath: \FavoriteRoutes.name, ascending: true)
    ]
  ) var favoriteRoutes: FetchedResults<FavoriteRoutes>
  
  @State private var selection = 0
  
  var body: some View {
    ZStack {
      TabView(selection: $selection) {
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
        
        FavoriteList(viewModel: viewModel)
          .tabItem {
            Image(systemName: "star")
            Text("Favorites")
        }.tag(3)
      }
      .blur(radius: viewModel.routes.isEmpty ? 10 : 0)
      
      if viewModel.routes.isEmpty {
        loading
      }
    }.onAppear {
      self.selection = self.favoriteRoutes.count > 0 ? 3 : 0
    }
  }
}

private extension ContentView {
  var loading: some View {
    Text("Loading...")
      .foregroundColor(.gray)
  }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
