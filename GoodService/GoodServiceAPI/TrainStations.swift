//
//  TrainStations.swift
//  GoodService
//
//  Created by Chris Sanders on 3/5/20.
//  Copyright © 2020 Chris Sanders. All rights reserved.
//

import Foundation

class TrainStations {
  var trainStationData = ""
//  var trainStationDataArray = [String]()

  func getTrainStation() {
    guard let filepath = Bundle.main.url(forResource: "Stations", withExtension: "csv") else {
      fatalError("Couldn't find train stations in main bundle.")
    }

    do {
      self.trainStationData = try String(contentsOf: filepath)
//      self.trainStationDataArray = trainStationData.split { $0.isNewline }
    } catch {
      fatalError("Couldn't load train station data from main bundle:\n\(error)")
    }
  }
}
