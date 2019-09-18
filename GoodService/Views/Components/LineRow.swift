//
//  LineRow.swift
//  GoodService
//
//  Created by Chris Sanders on 9/17/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct LineRow: View {
    var line: Line
    var body: some View {
        VStack {
            HStack {
                Text(line.name)
                Spacer()
                Text(line.status)
            }
            HStack {
                ForEach(line.routes, id: \.self) { route in
                    Text(route.name)
                        .foregroundColor(.white)
                        .frame(width: 25, height:25)
                        .background(self.createBackground(from: route.color))
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding(0)
            Spacer()
        }
        .padding()
    }
    
//    init(route: Route) {
//        self.route = route
//
//        self.backgroundColor = createBackground(from: route.color ?? "")
//
//        switch route.status {
//        case "Good Service":
//            self.statusColor = Color.goodService
//        case "Not Good":
//            self.statusColor = Color.notGoodService
//        case "Service Change":
//            self.statusColor = Color.serviceChange
//        case "Delay":
//            self.statusColor = Color.delayedService
//        case "Not Scheduled":
//            fallthrough
//        default:
//            self.statusColor = Color.noService
//        }
//    }
    
    func createBackground(from hex: String) -> Color {
        var hexString = ""
        if !hex.isEmpty {
            hexString = hex + "ff"
            return Color(hex: hexString)
        }
        return Color(red: 118 / 255, green: 118 / 255, blue: 118 / 255)
    }
}

struct LineRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineRow(line: routesInfo.lines["Manhattan"]![0])
                .previewLayout(.fixed(width: 320, height: 90))
            
            LineRow(line: routesInfo.lines["Manhattan"]![1])
                .previewLayout(.fixed(width: 320, height: 90))
            
            LineRow(line: routesInfo.lines["Manhattan"]![2])
                .previewLayout(.fixed(width: 320, height: 90))
        }
    }
}
