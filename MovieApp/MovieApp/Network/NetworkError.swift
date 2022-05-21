//
//  NetworkError.swift
//  MovieApp
//
//  Created by Mingu Seo on 2022/05/21.
//

import Foundation

enum HTTPError: LocalizedError {
    case networkFailureError
    case typeMismatchError
    case noTokenError
    case tokenExpiredError
}

struct NetworkError: Error, Decodable {
    var statusCode: Int? = 0
    var error: String? = ""
    var message: String? = ""
    
    struct Message: Decodable {
        let error: String?
        let message: String?
    }
}

struct NetworkCommonErrors {
    private init() {}
    
    static let commonErrorMessage = "something_wrong"
    static let typeMismatchError = NetworkError(statusCode: 200, message: "Something went wrong")
}
