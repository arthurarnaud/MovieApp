//
//  MovieResults.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 19/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
}
