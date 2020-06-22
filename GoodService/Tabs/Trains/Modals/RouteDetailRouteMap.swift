//
//  RouteDetailRouteMap.swift
//  GoodService
//
//  Created by Chris Sanders on 8/18/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI
import MapKit

struct RouteDetailRouteMap: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var routeMapsInfo: RouteDetailRouteMapViewModel
    
    // MARK: - Route Variables
    var id: String
    var routeName: String
    var routeBackgroundColor =  Color(red: 0.0, green: 0.0, blue: 0.0)
    var northRoute = [String]()
    var southRoute = [String]()
    var trainStations = TrainStations()
    
    
    var body: some View {
        VStack {
            header
            RouteMapView(
                annotations: routeMapsInfo.trainStationAnnotations,
                routeCoordinates: routeMapsInfo.trainStationCoordinates,
                strokeColor: routeBackgroundColor
            )
                .edgesIgnoringSafeArea(.bottom)
        }.edgesIgnoringSafeArea(.bottom)
    }
    
    init(id: String, routeName: String) {
        self.routeName = routeName
        self.id = id
        self.routeMapsInfo = RouteDetailRouteMapViewModel(
            id: id,
            name: routeName
        )
        self.trainStations.getTrainStation()
    }
}

extension RouteDetailRouteMap {
    var header: some View {
        HStack {
            Text(routeName)
                .foregroundColor(.white)
                .padding()
                .frame(
                    width: 50,
                    height: 50
            )
                .background(routeMapsInfo.routeBackgroundColor)
                .clipShape(Circle())
                .minimumScaleFactor(0.01)
        }
        .padding()
    }
}

#if DEBUG
struct RouteDetailRouteMap_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailRouteMap(id: "1", routeName: "1")
    }
}
#endif
