//
//  RouteList.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteList: View {
    @ObservedObject var routeInfo = RoutesInfoViewModel()
    
    var body: some View {
        NavigationView {
            List(routeInfo.routes, id: \.self) { route in
                NavigationLink(destination: RouteDetail(route: route)) {
                    RouteRow(route: route)
                }
            }
            .navigationBarTitle(Text("goodservice.io"))
        }
    }
}

#if DEBUG
struct RouteList_Previews: PreviewProvider {
    static var previews: some View {
        RouteList()
    }
}
#endif
