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
    case search(query:String, page:Int)
}

extension MovieAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        case .popular:
            return "movie/popular"
        case .upcoming:
            return "movie/upcoming"
        case .recommended(let id):
            return "movie/\(id)/recommendations"
        case .search:
            return  "search/movie"
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
        case .search(let query, let page):
            return .requestParameters(parameters: ["api_key":  NetworkManager.MovieAPIKey,"query":query, "page": page, "include_adult": false], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
