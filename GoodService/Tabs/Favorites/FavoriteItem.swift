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
    VStack(alignment: .leading) {
      ZStack(alignment: .bottom) {
        HStack(alignment: .top) {
          Text(favoriteItem.name)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 50.0, height: 50.0)
            .background(favoriteItem.color)
            .clipShape(Circle())
          Text(favoriteItem.alternateName)
            .font(.footnote)
          Spacer()
        }
        HStack {
          Spacer()
          Text(favoriteItem.status)
            .font(.caption)
        }
      }
    }
    .padding(10)
  }
}

struct FavoriteItem_Preview: PreviewProvider {
  static var previews: some View {
    FavoriteItem(
      favoriteItem: FavoriteItemViewModel(
        id: "1",
        name: "1",
        alternateName: "Going North",
        status: "Good",
        hexColor: "#db2828"
      )
    )
    .previewLayout(.fixed(width: 320, height: 90))
  }
}
