//
//  RouteInfo.swift
//  GoodServiceIO
//
//  Created by Chris Sanders on 6/6/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

struct RouteInfo: Decodable  {
    let routes: [Route]
    let lines: [String: [Line]]
}
