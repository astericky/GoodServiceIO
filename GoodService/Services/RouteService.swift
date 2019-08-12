//
//  TrainService.swift
//  GoodServiceIO
//
//  Created by Chris Sanders on 6/4/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation

/**
 REMEMBER TO REFACTOR THIS INTO ONE FUNCTION
 (url: String, completetion: (<TYPE>) => ())
 */
class RouteService {
    func getRouteStats(completion: @escaping (RouteStats) -> ()) {
        let urlString = "https://www.goodservice.io/api/stats"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in

            if let err = err {
                print("FAILED: ", err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let routeStats = try JSONDecoder().decode(RouteStats.self, from: data)
                DispatchQueue.main.async {
                    completion(routeStats)
                }
            } catch let jsonErr {
                print("FAILED: ", jsonErr)
            }
            
        }.resume()
    }
    
    func getRouteInfo(completion: @escaping (RouteInfo) -> ()) {
        let urlString = "https://www.goodservice.io/api/info"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let err = err {
                print("FAILED: ", err)
                return
            }
            
            guard let data = data else { return }
            
            do  {
                let routeInfo = try JSONDecoder().decode(RouteInfo.self, from: data)
                DispatchQueue.main.async {
                    completion(routeInfo)
                }
            } catch let error {
                print("FAILED:  ", error)
            }
        }.resume()
    }
    
    func getRouteMaps(completion: @escaping (RouteMaps) -> ()) {
        let urlString = "https://www.goodservice.io/api/routes"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
                    
            if let err = err {
                print("FAILED: ", err)
                return
            }
            
            guard let data = data else { return }
            
            do  {
                let routeInfo = try JSONDecoder().decode(RouteMaps.self, from: data)
                DispatchQueue.main.async {
                    completion(routeInfo)
                }
            } catch let error {
                print("FAILED:  ", error)
            }
        }.resume()
    }
}
