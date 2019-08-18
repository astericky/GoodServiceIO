//
//  RouteDetailRouteMap.swift
//  GoodService
//
//  Created by Chris Sanders on 8/18/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteDetailRouteMap: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Modal RouteDetailRouteMap")
        }
    }
}

#if DEBUG
struct RouteDetailRouteMap_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailRouteMap()
    }
}
#endif
