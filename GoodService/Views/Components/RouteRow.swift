//
//  RouteRow.swift
//  GoodService
//
//  Created by Chris Sanders on 7/21/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
// 

import SwiftUI

struct RouteRow: View {
    var route: Route
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                HStack(alignment: .top) {
                    Text(route.name)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 60.0, height: 60.0)
                        .background(
                           createBackground(from: route.color ?? "")
                        )
                        .clipShape(Circle())
                    Text(route.alternateName ?? "")
                       .font(.footnote)
                    Spacer()
                }
                HStack(alignment: .bottom) {
                   Spacer()
                   Text(route.status)
                       .font(.subheadline)
               }
            }
           
        }
        .padding()
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

#if DEBUG
struct RouteRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RouteRow(route: routesInfo.routes[23])
                .previewLayout(.fixed(width: 320, height: 90))
            
            RouteRow(route: routesInfo.routes[8])
                .previewLayout(.fixed(width: 320, height: 90))
                    
            RouteRow(route: routesInfo.routes[11])
                .previewLayout(.fixed(width: 320, height: 90))
        }
    }
}
#endif
