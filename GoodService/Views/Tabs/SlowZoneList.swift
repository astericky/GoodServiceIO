//
//  SlowZoneList.swift
//  GoodService
//
//  Created by Chris Sanders on 9/17/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Combine
import SwiftUI

struct SlowZoneList: View {
    @ObservedObject var routeInfo = RoutesInfoViewModel()
    
    var body: some View {
        NavigationView {
            List(routeInfo.slowZones, id: \.self) { line in
                NavigationLink(destination: LineDetail(line: line)) {
                    LineRow(line: line)
                }
            }
            .navigationBarTitle(Text("Slow Zones"))
        }
    }
}

struct SlowZoneList_Previews: PreviewProvider {
    static var previews: some View {
        SlowZoneList()
    }
}
