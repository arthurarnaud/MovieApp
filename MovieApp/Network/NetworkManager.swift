//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 19/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import Moya

class NetworkManager {
    static let shared = NetworkManager()
    static let MovieAPIKey = "fb3efb05e2a2669024f48db596b3f3d0"
    
    private let provider = MoyaProvider<MovieAPI>()
    
    func request<T: Codable>(target: MovieAPI, success successCallback: @escaping (T) -> Void, error errorCallback: @escaping (Error) -> Void) {

        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let results = try decoder.decode(T.self, from: response.data)
                    successCallback(results)
                } catch let error {
                    errorCallback(error)
                }
                
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
}

