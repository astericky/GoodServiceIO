//
//  RouteDirectionTable.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct RouteDirectionTable: View {
    private var name: String
    private  var routeDirectionList: [RouteDirectionRowViewModel]

    var body: some View {
        VStack {
            tableHeader
                
            Divider()
            
            ForEach(routeDirectionList, content: RouteDirectionRow.init(viewModel:))
        }
    }
    
    init(
        name: String,
        routeDirectionList: [InfoResponse.RouteDirection]
    ) {
        self.name = name
        self.routeDirectionList = routeDirectionList.map { RouteDirectionRowViewModel(item: $0) }
    }
}

extension RouteDirectionTable {
    var tableHeader: some View  {
        Text(name)
            .font(.headline)
            .padding(.top, 10)
    }
}

//struct RouteDirectionTable_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteDirectionTable(
//            name: routesInfo.routes[20].destinations.south[0],
//            routeDirectionList: routesInfo.routes[20].south
//        )
//        .previewLayout(.sizeThatFits)
//    }
//}

