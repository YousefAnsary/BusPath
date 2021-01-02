//
//  AuthenticationService.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import RxSwift

class MainService {
    
    private let headers = ["Authorization": UserSession.current.token]
    
    func login(name: String, password: String)-> Observable<LoginResponse?> {
        let params = ["name": name, "password": password, "deviceToken": ""]
        let ob = URLSessionManager.shared.reuqest(endpoint: .login, headers: nil, bodyParams: params)
        return ob.map { (data, res)-> LoginResponse? in
            do {
                return try data.decode(to: LoginResponse.self)
            } catch {
                print("Error Decoding Response \(error.localizedDescription)")
                return nil
            }
        }
        
    }
    
    func getText()-> Observable<[String: Any?]?> {
        
        URLSessionManager.shared.reuqest(endpoint: .aboutUs).map{ (data, res)-> [String: Any?]? in
            do {
                return try data.toDictionsay()
            } catch {
                print("Error Decoding Respone \(error.localizedDescription)")
                throw APIErrorType.decodingFailed
            }
        }
        
    }
    
}
