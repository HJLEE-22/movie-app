//
//  NetworkWrapper.swift
//  MovieApp
//
//  Created by Mingu Seo on 2022/05/21.
//

import Foundation
import Alamofire

struct NetworkWrapper {
    static let shared = NetworkWrapper()
    private var apiDomain =  "http://www.kobis.or.kr/kobisopenapi"
    private let jsonDecoder = JSONDecoder()
    
    private init() { }
        
    private func configureHeader() -> HTTPHeaders {
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 10
        manager.session.configuration.timeoutIntervalForResource = 10
        
        let headers: HTTPHeaders = [ "Accept": "application/json" ]
        
        return headers
    }
    
    func getBasicTask(stringURL: String, parameters: Parameters? = nil, header: HTTPHeaders? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        var defaultHeader = configureHeader()
        header?.forEach { defaultHeader[$0.name] = $0.value }
        AF.request("\(apiDomain)\(stringURL)", method: .get, encoding: JSONEncoding.default, headers: defaultHeader).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                if let responseData = response.data {
                    completion(.success(responseData))
                } else {
                    completion(.failure(HTTPError.networkFailureError))
                }
            case .failure(let error):
                if let responseData = response.data, let json = try? jsonDecoder.decode(NetworkError.self, from: responseData) {
                    completion(.failure(NetworkError(statusCode: error.responseCode, error: json.message, message: json.message)))
                } else {
                    completion(.failure(NetworkError(statusCode: error.responseCode, message: error.localizedDescription)))
                }
            }
        }
    }
}
