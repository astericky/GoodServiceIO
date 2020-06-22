//
//  RouteMapAnnotationView.swift
//  GoodService
//
//  Created by Chris Sanders on 6/20/20.
//  Copyright © 2020 Chris Sanders. All rights reserved.
//

import SwiftUI
import MapKit

class RouteMapAnnotationView: MKAnnotationView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        guard let routeMapAnnotation = self.annotation as? RouteMapAnnotation else { return }
        image = routeMapAnnotation.image
    }
}
