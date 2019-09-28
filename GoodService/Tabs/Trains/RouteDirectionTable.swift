//
//  RouteDirectionTable.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//
//
//import SwiftUI
//
//struct RouteDirectionTable: View {
//    var name: String
//    var routeDirectionList: [RouteDirection]
//    
//    var body: some View {
//        VStack {
//            Text(name)
//                .font(.headline)
//                .padding(.top, 10)
//                
//            
//            Divider()
//            
//            ForEach(routeDirectionList, id: \.self) { routeDirection in
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text(routeDirection.name)
//                            .font(.headline)
//                        Spacer()
//                    }
//                    
//                    HStack {
//                        Text("Actual Max Wait:")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                        Text("\(routeDirection.maxActualWait ?? 0) minutes")
//                            .font(.caption)
//                    }
//                    
//                    HStack {
//                        Text("Scheduled Max Wait:")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                        Text("\(routeDirection.maxActualWait ?? 0) minutes")
//                            .font(.caption)
//                    }
//                    
//                    HStack {
//                        Text("Traffic Conditions:")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                        Text("\(self.convertDecimalToPercentString(number: routeDirection.trafficCondition ?? 0.0))")
//                            .font(.caption)
//                    }
//                }
//                .padding(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
//            }
//        }
//    }
//    
//    func convertDecimalToPercentString(number: Double) -> String {
//        "\((number * 100).format(f: 2))%"
//    }
//}
//
//#if DEBUG
//struct RouteDirectionTable_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteDirectionTable(
//            name: routesInfo.routes[20].destinations.south[0],
//            routeDirectionList: routesInfo.routes[20].south
//        )
//        .previewLayout(.sizeThatFits)
//    }
//}
//#endif
