//
//  Repository.swift
//  MovieApp
//
//  Created by Mingu Seo on 2022/05/21.
//

import Foundation
import Alamofire

struct Repository {
    
    private let jsonDecoder = JSONDecoder()
    private let apiKey = Bundle.main.apiKey
    typealias completion<T> = (T?, Error?) -> ()
    
    func getMoviesPlaying(completion: @escaping completion<MoviePlayingResponse>) {
        let stringURL = "/now_playing?api_key=\(apiKey)&language=ko&page=\(1)"
        NetworkWrapper.shared.getBasicTask(stringURL: stringURL) { result in
            switch result {
            case .success(let responseData):
                if let data = try? jsonDecoder.decode(MoviePlayingResponse.self, from: responseData) {
                    completion(data, nil)
                } else {
                    completion(nil, HTTPError.typeMismatchError)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getMovie(completion: @escaping completion<Movie>) {
        let stringURL = "/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(apiKey)&targetDt=20220520"
        NetworkWrapper.shared.getBasicTask(stringURL: stringURL) { result in
            switch result {
            case .success(let responseData):
                if let data = try? jsonDecoder.decode(Movie.self, from: responseData) {
                    completion(data, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
