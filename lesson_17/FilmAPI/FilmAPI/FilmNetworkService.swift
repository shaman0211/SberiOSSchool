//
//  FilmNetworkService.swift
//  FilmAPI
//
//  Created by Artem  on 06.06.2021.
//

import UIKit


final class FilmNetworkService  {
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
        

}

extension FilmNetworkService: FilmNetworkServiceProtocol {
    func getFilm(complition: @escaping (GetFilmAPIResponse) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=1a424b676a5fe546fc60b68ca9928d12&language=en-US&page=1"
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            if let data = data {
                do {
                    let popularFilm = try self.decoder.decode(GetFilmResponse.self, from: data)
                    complition(.success(popularFilm))
                } catch let error {
                    print(error)
                }
            }
        }.resume()
        
    }
    
    func getImage(path: String, complition: @escaping (Data) -> Void) {
        let string = "https://image.tmdb.org/t/p/original" + path
                guard let url = URL(string: string) else {
                    return
                }
                session.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    }

                    if let data = data {
                        complition(data)
                    }
                }.resume()
            }

}

