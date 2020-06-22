//
//  RouteMap.swift
//  GoodService
//
//  Created by Chris Sanders on 5/22/20.
//  Copyright © 2020 Chris Sanders. All rights reserved.
//

import SwiftUI
import MapKit

struct RouteMapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    let mapView = MKMapView()
    var annotations = [RouteMapAnnotation]()
    var routeCoordinates = [CLLocationCoordinate2D]()
    var strokeColor: Color
    
    class Coordinator: NSObject, MKMapViewDelegate {
        init(mapView: MKMapView) {
            super.init()
            mapView.delegate = self
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let routeMapAnnotationView = RouteMapAnnotationView(annotation: annotation, reuseIdentifier: "id")
            routeMapAnnotationView.canShowCallout = true
            return routeMapAnnotationView
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = .red
            lineView.lineWidth = 2
            return lineView
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(mapView: mapView)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        setRegionForMapView()
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let polyline = MKPolyline(
            coordinates: routeCoordinates,
            count: routeCoordinates.count
        )
        uiView.removeOverlays(uiView.overlays)
        uiView.addOverlay(polyline)
        uiView.addAnnotations(annotations)
    }
    
    func setRegionForMapView() {
        let centerCoordinate = CLLocationCoordinate2D(latitude: 40.775712, longitude: -73.987954)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}
