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
}

struct NetworkError: Error, Decodable {
    let statusCode: Int
    let statusMessage: String
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}

struct NetworkCommonErrors {
    private init() {}
    
    static let commonErrorMessage = "something_wrong"
    static let typeMismatchError = NetworkError(statusCode: 200, statusMessage: commonErrorMessage, success: true)
}
