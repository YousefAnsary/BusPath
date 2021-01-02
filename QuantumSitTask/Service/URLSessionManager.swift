//
//  URLSessionManager.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import RxSwift

class URLSessionManager {
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    private let session: URLSession
    public static let shared = URLSessionManager()
    
    func request(endpoint: Endpoint, headers: [String: String]? = nil,
                 queryParams: [String: String]? = nil,
                 bodyParams: [String: Any]? = nil,
                 completion: @escaping (Data?, URLResponse?, Error?)-> Void) {
        
        let fullURL = endpoint.fullUrl!
        var urlComponents = URLComponents(string: fullURL)
        if let queryParams = queryParams {
            urlComponents?.query = queryString(fromDict: queryParams)
        }
        guard let url = urlComponents?.url else {fatalError("Invalid URL: \(fullURL)")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod.rawValue
        
        if endpoint.httpMethod == .post {
            urlRequest.addValue(url.host ?? "\(Constatnts.baseURL)", forHTTPHeaderField: "Host")
            urlRequest.addValue("63", forHTTPHeaderField: "Content-Length")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        headers?.forEach{ (key, val) in urlRequest.addValue(val, forHTTPHeaderField: key) }
        
        if let bodyParams = bodyParams {
            urlRequest.httpBody = setupBodyParams(params: bodyParams)
        }
        
        session.dataTask(with: urlRequest) { data, res, err in
            completion(data, res, err)
        }.resume()
        
    }
    
    func reuqest(endpoint: Endpoint, headers: [String: String]? = nil,
                 queryParams: [String: String]? = nil,
                 bodyParams: [String: Any]? = nil)-> Observable<(Data, URLResponse)> {
        Observable.create { observer in
            self.request(endpoint: endpoint, headers: headers, queryParams: queryParams, bodyParams: bodyParams) {
                (data, res, err) in
                let statusCode = (res as? HTTPURLResponse)?.statusCode
                guard data != nil, res != nil, err == nil else {
                    observer.onError(APIError(data: data, error: err, statusCode: statusCode))
                    observer.onCompleted()
                    return
                }
                observer.onNext((data!, res!))
                observer.onCompleted()
            }
            return Disposables.create()
        }
        
    }
    
    private func queryString(fromDict dict: [String: Any])-> String? {
        return dict.map { key, val in "\(key)=\(val)" }.joined(separator: "&")
    }
    
    private func setupBodyParams(params: [String: Any])-> Data {
        do {
            return try JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            fatalError("Error Encoding Parameters")
        }
    }
    
}

extension URLSessionManager {
    
    
    
}
