//
//  APIErrorType.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

enum APIErrorType: Error {
    case unAuthenticated
    case unAuthorized
    case notFound
    case methodNotAllowed
    case internalServerError
    case other(statusCode: Int)
    case decodingFailed
    
    init(rawValue: Int) {
        switch rawValue {
        case 200:
            self = .decodingFailed
        case 401:
            self = .unAuthenticated
        case 403:
            self = .unAuthorized
        case 404:
            self = .notFound
        case 405:
            self = .methodNotAllowed
        case 500:
            self = .internalServerError
        default:
            self = .other(statusCode: rawValue)
        }
    }
    
}
