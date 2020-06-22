//
//  RouteMapAnnotation.swift
//  GoodService
//
//  Created by Chris Sanders on 6/20/20.
//  Copyright © 2020 Chris Sanders. All rights reserved.
//

import SwiftUI
import MapKit

class RouteMapAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    var image = UIImage(systemName: "circle.fill")
    
    init(
        coordinate: CLLocationCoordinate2D,
        title: String?,
        subtitle: String?
    ) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
//        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 5)
//        image = UIImage(systemName: "circle.fill", withConfiguration: symbolConfiguration)?
//            .withTintColor(UIColor.red, renderingMode: .alwaysOriginal)
        
        image = UIImage.init(color: UIColor.red)
    }
}
