//
//  ContentView.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            RouteList()
                .tabItem {
                    Image("subway")
                    Text("Trains")
                }.tag(0)
            
            LineBoroughList()
                .tabItem {
                    Image("railway")
                    Text("Lines")
                }.tag(1)
            
            SlowZoneList()
                .tabItem {
                    Image("problem")
                    Text("Slow Zones")
                }.tag(2)
            
            FavoriteList()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }.tag(3)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
