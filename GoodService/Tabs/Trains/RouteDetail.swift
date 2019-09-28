//
//  RouteDetail.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Combine
import SwiftUI

struct RouteDetail: View {

    @State var showModal = false
    
    var route: InfoResponse.Route
    var statusColor = Color(red: 0.0, green: 0.0, blue: 0.0)
    var backgroundColor = Color(red: 0.0, green: 0.0, blue: 0.0)
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                HStack(alignment: .top) {
                    Text(route.name)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .frame(
                            width: 100,
                            height: 100
                        )
                        .background(backgroundColor)
                        .clipShape(Circle())
                        Text(route.alternateName ?? "Hello World")
                            .font(.caption)
                    Spacer()
                }
                .padding(.init(top: -10, leading: 16, bottom: 16, trailing: 16))
                
                HStack(alignment: .bottom) {
                    Spacer()
                    Button("Route Map") {
                        self.showModal.toggle()
                    }
                }
                .padding(.trailing, 16)
            }
            
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(route.status)
                        .font(.title)
                        .foregroundColor(statusColor)
                        .fixedSize()
                    Text("STATUS")
                }
                Spacer(  )
            }
            .padding()
            .background(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
            .foregroundColor(Color.white)
                
//            RouteDirectionTable(name: "South", routeDirectionList: route.south)
//            RouteDirectionTable(name: "North", routeDirectionList: route.north)
        }
//        .sheet(isPresented: $showModal) {
//            RouteDetailRouteMap(routeName: self.route.name)
//        }
    }
        
    init(route: InfoResponse.Route) {
        self.route = route
        
        self.backgroundColor = createBackground(from: route.color ?? "")
        
        switch route.status {
        case "Good Service":
            self.statusColor = Color.goodService
        case "Not Good":
            self.statusColor = Color.notGoodService
        case "Service Change":
            self.statusColor = Color.serviceChange
        case "Delay":
            self.statusColor = Color.delayedService
        case "Not Scheduled":
            fallthrough
        default:
            self.statusColor = Color.noService
        }
    }
    
    func createBackground(from hex: String) -> Color {
        var hexString = ""
        if !hex.isEmpty {
            hexString = hex + "ff"
            return Color(hex: hexString)
        }
        return Color(red: 118 / 255, green: 118 / 255, blue: 118 / 255)
    }
}


//#if DEBUG
//struct RouteDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteDetail(route: routesInfo.routes[8])
//    }
//}
//#endif
