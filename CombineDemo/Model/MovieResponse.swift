//
//  MovieResponse.swift
//  CombineDemo
//
//  Created by Inpyo Hong on 2021/08/09.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
