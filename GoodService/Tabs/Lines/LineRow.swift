//
//  LineRow.swift
//  GoodService
//
//  Created by Chris Sanders on 9/17/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

//struct LineRow: View {
//    var line: LineRowViewModel
//    var body: some View {
//        VStack {
//            HStack {
//                Text(line.name)
//                Spacer()
//                Text(line.status)
//            }
//            HStack {
//                ForEach(line.routes, id: \.self) { route in
//                    Text(route.name)
//                        .foregroundColor(.white)
//                        .frame(width: 25, height:25)
//                        .background(route.color)
//                        .clipShape(Circle())
//                }
//                Spacer()
//            }
//            .padding(0)
//            Spacer()
//        }
//        .padding()
//    }
//    
//    init(line: LineRowViewModel) {
//        self.line = line
//    }
//}

//struct LineRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LineRow(line: routesInfo.lines["Manhattan"]![0])
//                .previewLayout(.fixed(width: 320, height: 90))
//
//            LineRow(line: routesInfo.lines["Manhattan"]![1])
//                .previewLayout(.fixed(width: 320, height: 90))
//
//            LineRow(line: routesInfo.lines["Manhattan"]![2])
//                .previewLayout(.fixed(width: 320, height: 90))
//        }
//    }
//}
