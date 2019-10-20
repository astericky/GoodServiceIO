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
    @Published var routes: [RouteRowViewModel] = []
    @Published var lines: [LineBoroughViewModel] = []
    @Published var slowZones: [LineRowViewModel] = []

    private var goodServiceFetcher: GoodServiceFetcher
    private var disposables = Set<AnyCancellable>()
    
    private var timer: Timer?
    
    init(
        goodServiceFetcher: GoodServiceFetcher,
        scheduler: DispatchQueue = DispatchQueue(label: "RoutesInfoViewModel")
    ) {
        self.goodServiceFetcher = goodServiceFetcher

        self.fetchRoutesInfo()
        
        timer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { timer in
            self.fetchRoutesInfo()
        }

    }

    func fetchRoutesInfo() {
        goodServiceFetcher.getInfo()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.routes = []
                        self.lines = []
                        self.slowZones = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] info in
                    guard let self = self else { return }
                    self.routes = info.routes.map(RouteRowViewModel.init(item:))
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
    
    func getSlowLines() -> [LineRowViewModel] {
        var lines = self.lines.flatMap({
            $0.lines
        })

        lines.sort { $0.maxTravelTime > $1.maxTravelTime }
        return Array(lines.prefix(10))
    }
}



