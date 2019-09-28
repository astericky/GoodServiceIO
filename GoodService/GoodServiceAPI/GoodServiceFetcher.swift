//
//  GoodServiceFetcher.swift
//  GoodService
//
//  Created by Chris Sanders on 9/24/19.
//  Copyright © 2019 Chris Sanders. All rights reserved.
//

import Foundation
import Combine

protocol GoodServiceFetchable {
    func getInfo() -> AnyPublisher<InfoResponse, GoodServiceError>
}

class GoodServiceFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension GoodServiceFetcher: GoodServiceFetchable {
    func getInfo() -> AnyPublisher<InfoResponse, GoodServiceError> {
        let urlString = "https://www.goodservice.io/api/info"
        guard let url = URL(string: urlString) else {
            let error = GoodServiceError.network(description: "Couldn't create url.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .map { $0.data  }
            .decode(type: InfoResponse.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}