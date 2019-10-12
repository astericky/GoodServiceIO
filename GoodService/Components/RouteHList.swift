//
//  RouteHList.swift
//  GoodService
//
//  Created by Chris Sanders on 10/12/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteHList: View {
    var routes = [LineRouteRowViewModel]()
    var body: some View {
        HStack {
            ForEach(routes, id: \.self) { route in
                Text(route.name)
                    .foregroundColor(.white)
                    .frame(width: 25, height:25)
                    .background(route.color)
                    .clipShape(Circle())
            }
        }
    }
}

struct RouteHList_Previews: PreviewProvider {
    static var previews: some View {
        RouteHList()
    }
}
