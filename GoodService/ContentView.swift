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
        TabView(selection: .constant(0)) {
            RouteList()
                .tabItem {
                    Image("subway-3")
                    Text("Trains")
                }.tag(0)
            
            VStack {
                Text("Tab 2")
            }
            .tabItem {
                Image("railway")
                Text("Lines")
            }.tag(1)
            
            VStack {
                Text("Tab 3")
            }
            .tabItem {
                Image(systemName: "star")
                Text("Slow Zones")
            }.tag(2)
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
