//
//  Networking.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation

protocol Networking {}

extension Networking {
    func request<T: Codable>(target: MovieAPI, success successCallback: @escaping (T) -> Void, error errorCallback: @escaping (Error) -> Void) {
        NetworkManager.shared.request(target: target, success: successCallback, error: errorCallback)
    }
}
