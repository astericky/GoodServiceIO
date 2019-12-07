//
//  FavoriteItem.swift
//  GoodService
//
//  Created by Chris Sanders on 12/7/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct FavoriteItem: View {
  var favoriteItem: FavoriteItemViewModel
  
  var body: some View {
    VStack {
      HStack {
        Text(favoriteItem.name)
        Text(favoriteItem.alternateName)
          .font(.caption)
        Spacer()
      }
      HStack {
        Spacer()
        Text(favoriteItem.status)
      }
    }
  }
}
