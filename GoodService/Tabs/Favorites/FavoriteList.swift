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
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(
    entity: FavoriteRoutes.entity(),
    sortDescriptors: [
      NSSortDescriptor(keyPath: \FavoriteRoutes.name, ascending: true)
    ]
  ) var favoriteRoutes: FetchedResults<FavoriteRoutes>
  
  var body: some View {
    NavigationView {
      List(favoriteRoutes, id: \.self) { favorite in
        FavoriteItem(
          favoriteItem: FavoriteItemViewModel(
            id: favorite.id ?? "",
            name: favorite.name ?? "",
            alternateName: favorite.alternateName ?? "",
            status: favorite.status ?? "",
            hexColor: favorite.color ?? ""
          )
        )
      }
      .navigationBarTitle(Text("Favorites"))
    }
  }
}

//struct FavoriteList_Previews: PreviewProvider {
//  static var previews: some View {
//    FavoriteList()
//  }
//}
