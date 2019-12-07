//
//  FavoriteItemViewModel.swift
//  GoodService
//
//  Created by Chris Sanders on 12/7/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct FavoriteItemViewModel {
  var id: String
  var name: String
  var alternateName: String
  var status: String
  var hexColor: String?

  var color: Color {
    Color.createColor(from: hexColor ?? "")
  }
  
  var statusColor: Color {
    switch status {
    case "Good Service":
      return Color("color-good-service")
    case "Not Good":
      return Color("color-not-good-service")
    case "Service Change":
      return Color("color-service-change")
    case "Delay":
      return Color("color-delayed-service")
    case "Not Scheduled":
      fallthrough
    default:
      return Color("color-no-service")
    }
  }
}
