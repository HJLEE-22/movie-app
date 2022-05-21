//
//  Movie.swift
//  MovieApp
//
//  Created by Mingu Seo on 2022/05/21.
//

import Foundation

struct MoviePlayingResponse: Decodable {
    let page: Int
    let dates: [String: String]
    let results: [Movie]
}

struct MovieResponse: Decodable {
    let movie: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let overview: String
    let releaseDate: String
    let title: String
    var posterPath: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case releaseDate = "release_date"
        case title
        case posterPath = "poster_path"
    }
}
