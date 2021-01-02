//
//  UserSession.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/10/20.
//

import Foundation

class UserSession {
    
    private init() {}
    
    public static let current = UserSession()
    
    var token: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI0NywiaXNzIjoiaHR0cDovL2luYWNsaWNrLm9ubGluZS9tdGMvYWNjb3VudC9jaGVja0NyZWRlbnRpYWxzIiwiaWF0IjoxNjA3NTgyMDUwLCJleHAiOjE2MDc2Njg0NTAsIm5iZiI6MTYwNzU4MjA1MCwianRpIjoiRkRyOTVPTEI2Z3BsR0oxUyJ9.5o_ApmfHt8X2UrPCTL-R4BoBji5AM6e2RfBRQ-j3LM8"
    
}
