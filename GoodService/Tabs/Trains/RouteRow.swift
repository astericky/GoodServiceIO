//
//  RouteRow.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
// 

import SwiftUI

struct RouteRow: View {
    private let route: RouteRowViewModel
    
    var body: some View {
        NavigationLink(destination: RouteDetail(route: route)) {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottom) {
                    HStack(alignment: .top) {
                        routeName
                        routeAlternateName
                        Spacer()
                    }
                    HStack(alignment: .bottom) {
                       Spacer()
                       routeStatus
                   }
                }
               
            }
            .padding(10)
        }
    }
    
    init(viewModel: RouteRowViewModel) {
        self.route = viewModel
    }
}

private extension RouteRow {
    var routeName: some View {
        Text(route.name)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 50.0, height: 50.0)
            .background(route.color)
            .clipShape(Circle())
    }
    
    var routeAlternateName: some View {
        Text(route.alternateName)
            .font(.footnote)
    }
    
    var routeStatus: some View {
        Text(route.status)
            .font(.caption)
    }
}

//#if DEBUG
//struct RouteRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            RouteRow(route: routesInfo.routes[23])
//                .previewLayout(.fixed(width: 320, height: 90))
//
//            RouteRow(route: routesInfo.routes[8])
//                .previewLayout(.fixed(width: 320, height: 90))
//
//            RouteRow(route: routesInfo.routes[11])
//                .previewLayout(.fixed(width: 320, height: 90))
//        }
//    }
//}
//#endif
