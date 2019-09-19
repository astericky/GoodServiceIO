//
//  SlowZoneList.swift
//  GoodService
//
//  Created by Chris Sanders on 9/17/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct SlowZoneList: View {
    @ObservedObject var routeInfo = RoutesInfoViewModel()
    
    var slowLines = [Line]()
    
    var body: some View {
        NavigationView {
            List(slowLines, id: \.self) { line in
                NavigationLink(destination: LineDetail(line: line)) {
                    LineRow(line: line)
                }
            }
            .navigationBarTitle(Text("Slow Zones"))
        }
    }
        
    
    init() {
        slowLines = routeInfo.getSlowLines()
    }
}

struct SlowZoneList_Previews: PreviewProvider {
    static var previews: some View {
        SlowZoneList()
    }
}
