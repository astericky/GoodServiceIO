//
//  LineList.swift
//  GoodService
//
//  Created by Chris Sanders on 9/15/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//
//
//import SwiftUI
//
//struct LineBoroughList: View {
//    @ObservedObject var routeInfo = RoutesInfoViewModel()
//    
//    var boroughs = [String]()
//    var body: some View {
//        NavigationView {
//            List(boroughs, id: \.self) { borough in
//                NavigationLink(destination: LineList(name: borough, lines: self.routeInfo.lines[borough]!)) {
//                    Text(borough)
//                }
//            }
//            .navigationBarTitle(Text("Boroughs"))
//        }
//    }
//    
//    init() {
//        self.boroughs = self.routeInfo.lines.map { $0.key }
//    }
//}
//
//struct LineBoroughList_Previews: PreviewProvider {
//    static var previews: some View {
//        LineBoroughList()
//    }
//}
