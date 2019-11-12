//
//  RoutesViewModel.swift
//  GoodServiceIO
//
//  Created by Chris Sanders on 6/6/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Combine
import SwiftUI

final class RoutesInfoViewModel: ObservableObject, Identifiable {
  private var timestamp = ""
  var datetime: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    dateFormatter.timeZone = TimeZone.init(abbreviation: "EST")
    let date = dateFormatter.date(from: timestamp)
    let dateDisplayFomatter = DateFormatter()
    dateDisplayFomatter.dateFormat = "MMM dd, yyyy h:mm a"
    
    return dateDisplayFomatter.string(from: date ?? Date())
  }
  @Published var routes: [RouteRowViewModel] = []
  @Published var lines: [LineBoroughViewModel] = []
  @Published var slowZones: [LineRowViewModel] = []
  @Published var favorites: [RouteRowViewModel] = []
  @FetchRequest(
    entity: FavoriteRoutes.entity(),
    sortDescriptors: [
      NSSortDescriptor(keyPath: \FavoriteRoutes.name, ascending: true)
    ]
  ) var favoriteRoutes: FetchedResults<FavoriteRoutes>
  
  private var goodServiceFetcher: GoodServiceFetcher
  private var disposables = Set<AnyCancellable>()
  
  private var timer: Timer?
  
  init(
    goodServiceFetcher: GoodServiceFetcher,
    scheduler: DispatchQueue = DispatchQueue(label: "RoutesInfoViewModel")
  ) {
    self.goodServiceFetcher = goodServiceFetcher
    
    self.fetchRoutesInfo()
    
    timer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { timer in
      self.reset()
      self.fetchRoutesInfo()
    }
    
  }
  
  func fetchRoutesInfo() {
    print(favoriteRoutes)
    self.reset()
    goodServiceFetcher.getInfo()
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure:
            self.reset()
          case .finished:
            break
          }
        },
        receiveValue: { [weak self] info in
          guard let self = self else { return }
          self.timestamp = info.timestamp
          self.routes = info.routes.map({ route in
//            let isFavorite = self.favoriteRoutes.filter({ $0.id == route.id }).count > 0
            let route = InfoResponse.Route(
              id: route.id,
              name: route.name,
              status: route.status,
              alternateName: route.alternateName,
              color: route.color,
              destinations: route.destinations,
              north: route.north,
              south: route.south
//              isFavorite: isFavorite
            )
            return RouteRowViewModel(item: route)
          })
          self.lines = info.lines.map({
            let lines = $0.value.map({
              LineRowViewModel(item: $0)
            })
            return LineBoroughViewModel.init(name: $0.key, lines: lines)
          })
          self.slowZones = self.getSlowLines()
      })
      .store(in: &disposables)
  }
  
  func reset() {
    self.timestamp = ""
    self.routes = []
    self.lines = []
    self.slowZones = []
  }
  
  func getSlowLines() -> [LineRowViewModel] {
    var lines = self.lines.flatMap({
      $0.lines
    })
    
    lines.sort { $0.maxTravelTime > $1.maxTravelTime }
    return Array(lines.prefix(10))
  }
}



