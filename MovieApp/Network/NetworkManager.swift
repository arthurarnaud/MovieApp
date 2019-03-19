//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 19/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import Moya

struct NetworkManager {
    static let MovieAPIKey = "fb3efb05e2a2669024f48db596b3f3d0"
    static let provider = MoyaProvider<MovieApi>()
    
    static func request(target: MovieApi, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (MoyaError) -> Void) {

        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                successCallback(response)
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
}

