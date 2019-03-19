//
//  MovieAPI.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 19/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    case nowPlaying(page: Int)
    case popular(page: Int)
    case upcoming(page: Int)
    case recommended(id: Int)
}

extension MovieAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "now_playing"
        case .popular:
            return "popular"
        case .upcoming:
            return "upcoming"
        case .recommended(let id):
            return "\(id)/recommendations"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .nowPlaying(let page), .popular(let page), .upcoming(let page):
            return .requestParameters(parameters: ["page":page, "api_key": NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
        case .recommended:
            return .requestParameters(parameters: ["api_key":  NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
