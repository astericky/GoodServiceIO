//
//  SlowZoneList.swift
//  GoodService
//
//  Created by Chris Sanders on 9/17/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct SlowZoneList: View {
    @ObservedObject var viewModel: RoutesInfoViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.slowZones, id: \.self) { line in
                Text(line.name)
//                NavigationLink(destination: LineDetail(item: line)) {
//                    LineRow(item: line)
//                }
            }
            .navigationBarTitle(Text("Slow Zones"))
        }
    }
    init(viewModel: RoutesInfoViewModel) {
        self.viewModel = viewModel
    }
}

//struct SlowZoneList_Previews: PreviewProvider {
//    static var previews: some View {
//        SlowZoneList()
//    }
//}
