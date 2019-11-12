//
//  FavoriteList.swift
//  GoodService
//
//  Created by Chris Sanders on 9/17/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import SwiftUI

struct FavoriteList: View {
  @ObservedObject var viewModel: RoutesInfoViewModel
  
  var body: some View {
    List(viewModel.favoriteRoutes, id: \.self) { route in
      Text("Hello chris")
    }
  }
}

//struct FavoriteList_Previews: PreviewProvider {
//  static var previews: some View {
//    FavoriteList()
//  }
//}
