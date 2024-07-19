//
//  NetworkManager.swift
//  Banking
//
//  Created by Всеволод Оплачко on 17.07.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
}

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

class NetworkManager {
    
    static var shared = NetworkManager()
    
    let BASE_URL = "https://api.yii2-stage.test.wooppay.com/v1"
    
    private init() {}
    
    func fetchData(from urlString: String,
                   parameters: [String: Any]?,
                   method: HTTPMethod,
                   completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard var urlComponents = URLComponents(string: "\(BASE_URL)/v1/\(urlString)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        print("URLComponents: \(urlComponents)")
        
        if let parameters = parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0, value: "\($1)")}
            print("Parameters: \(parameters)")
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        print(url.absoluteString)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.serverError("Server error: \(error.localizedDescription)")))
                return
            }
            
            guard let httpResponce = response as? HTTPURLResponse, (200..<300).contains(httpResponce.statusCode) else {
                
                completion(.failure(.serverError("Server error")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}


