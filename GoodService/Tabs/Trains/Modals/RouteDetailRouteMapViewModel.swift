//
//  RouteMapsViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 7/27/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

final class RouteDetailRouteMapViewModel: ObservableObject {

    @Published var id: String = ""
    @Published var name: String = ""
    @Published var routeMapsInfo: RouteMapsResponse?
    @Published var routeBackgroundColor: Color?
    @Published var route: RouteMapsResponse.Route?
    
    var trainStationCoordinates: [CLLocationCoordinate2D] = []
    var trainStationAnnotations: [RouteMapAnnotation] = []
    var trainStopDictionary: [String: CLLocationCoordinate2D] = [:]
    
    private var goodServiceFetcher = GoodServiceFetcher()
    private var disposables = Set<AnyCancellable>()
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
        self.fetchMapInfo()
        
    }
    
    func fetchMapInfo() {
        let subject = goodServiceFetcher.getMaps()
        subject
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.routeMapsInfo = nil
                        break
                    case .finished:
                        break
                    }
                },
                receiveValue: { routeMapInfo in
                    self.routeMapsInfo = routeMapInfo
                    self.route = routeMapInfo.routes[self.id]
                    self.routeBackgroundColor = Color.createColor(from: self.route?.color ?? "")
                    self.getTrainRoute()
            })
            .store(in: &disposables)
    }
    
    fileprivate func getTrainRoute() {
        var trainStationDataArray: [String]
        guard let filepath = Bundle.main.url(forResource: "Stations", withExtension: "csv") else {
            fatalError("Couldn't find train stations in main bundle.")
        }
        
        do {
            let trainStationData = try String(contentsOf: filepath)
            trainStationDataArray = trainStationData.components(separatedBy: "\n")
            trainStationDataArray.removeFirst()
            trainStationDataArray = trainStationDataArray.filter { $0 != "" }
            trainStationDataArray = trainStationDataArray.filter { station in
                let columns = station.components(separatedBy: ",")
                return columns[7].components(separatedBy: " ").contains { $0 == self.name }
            }
            
            var currentRoute = route?.routings["north"]?[0] ?? []
            currentRoute = currentRoute.map { stop in
                var stopName = stop
                stopName.removeLast()
                return stopName
            }
            
            trainStationDataArray.forEach { station in
                let columns = station.components(separatedBy: ",")
                print("station: \(columns[2]), routes: \(columns[7]), title: \(columns[5]), coordinate: \(columns[9]), \(columns[10])\n\n")
                
                let gtfsStopID = columns[2]
                let coordinate = CLLocationCoordinate2D(
                    latitude: CLLocationDegrees(Double(columns[9])!),
                    longitude: CLLocationDegrees(Double(columns[10])!)
                )
                trainStopDictionary[gtfsStopID] = coordinate
            }

            trainStationCoordinates = currentRoute.map { stop in
                trainStopDictionary[stop]!
            }
                        
            trainStationAnnotations = trainStationDataArray.map { station in
                let columns = station.components(separatedBy: ",")
                let coordindate = CLLocationCoordinate2D(
                    latitude: CLLocationDegrees(Double(columns[9])!),
                    longitude: CLLocationDegrees(Double(columns[10])!)
                )
                let annotation = RouteMapAnnotation(coordinate: coordindate, title: columns[5], subtitle: "")
                return annotation
            }
        } catch {
            fatalError("Couldn't load train station data from main bundle:\n\(error)")
        }
    }
}
