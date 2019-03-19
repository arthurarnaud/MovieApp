//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 19/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import Moya

protocol Networking {}

extension Networking {
    func request(target: MovieAPI, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (Error) -> Void) {
        NetworkManager.shared.request(target: target, success: successCallback, error: errorCallback)
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    static let MovieAPIKey = "fb3efb05e2a2669024f48db596b3f3d0"
    
    private let provider = MoyaProvider<MovieAPI>()
    
    func request(target: MovieAPI, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (MoyaError) -> Void) {

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

