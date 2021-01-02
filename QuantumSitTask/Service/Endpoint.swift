//
//  Endpoints.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

enum Endpoint: String {
    
    case login = "account/checkCredentials"
    case aboutUs = "aboutus/aboutUs"
    
    var fullUrl: String! {
        get {
            Constatnts.baseURL + self.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        get {
            switch self {
            case .login:
                return .post
            case .aboutUs:
                return .get
            }
        }
    }
    
}
