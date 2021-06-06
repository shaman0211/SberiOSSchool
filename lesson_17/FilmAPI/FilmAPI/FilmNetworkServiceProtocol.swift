//
//  FilmNetworkServiceProtocol.swift
//  FilmAPI
//
//  Created by Artem  on 06.06.2021.
//

import Foundation

typealias GetFilmAPIResponse = Result<GetFilmResponse, NetworkServiceError>

protocol FilmNetworkServiceProtocol {
    func getFilm(complition: @escaping (GetFilmAPIResponse) -> Void)
    func getImage(path: String, complition: @escaping (Data) -> Void)
}
