//
//  LineRow.swift
//  GoodService
//
//  Created by Chris Sanders on 9/15/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//
//
//import SwiftUI
//
//struct LineList: View {
//    var name: String
//    var lines: [Line]
//    
//    var body: some View {
//        List(lines, id: \.self) { line in
//            NavigationLink(destination: LineDetail(line: line)) {
//                LineRow(line: line)
//            }
//        }
//        .navigationBarTitle(Text(name))
//    }
//    
//}
//
//struct LineList_Previews: PreviewProvider {
//    static var previews: some View {
//        LineList(name: "Manhattan", lines: routesInfo.lines["Manhattan"]!)
//    }
//}
