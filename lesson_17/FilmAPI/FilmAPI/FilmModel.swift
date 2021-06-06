//
//  FilmModel.swift
//  FilmAPI
//
//  Created by Artem  on 06.06.2021.
//

import Foundation

struct GetFilmResponse: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    var title: String
    var posterPath: String
}
