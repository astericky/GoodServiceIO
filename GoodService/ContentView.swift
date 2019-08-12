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
        TabView(selection: .constant(1)) {
            RouteList()
                .tabItem({
                    Text("Trains")
                }).tag(1)
            
            VStack {
                Text("Tab 2")
            }
            .tabItem({
                Text("Lines")
            }).tag(2)
            
            VStack {
                Text("Tab 3")
            }
            .tabItem({
                Text("Slow Zones")
            }).tag(2)
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
