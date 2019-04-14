//
//  Movie.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 19/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String?
    let genreIds: [Int]
    let backdropPath: String?
    let overview: String
    let releaseDate: String
}
