//
//  AuthWorker.swift
//  Banking
//
//  Created by Всеволод Оплачко on 19.07.2024.
//

import Foundation

final class AuthWorker {
    func authMobPost(credentials: Credentials,
                  failure: @escaping ((Any) -> Void),
                  success: @escaping Success<Any>) {
        
        let parameters = ["login": credentials.login,
                          "password": credentials.password]
        
        NetworkManager.shared.fetchData(from: "/auth/mobile", parameters: parameters, method: .post) { result in
            
            switch result {
            case .success(let data):
                // обработать данные
                success(data)
                
            case .failure(let error):
                
                // Обработать ошибку
                print(error.localizedDescription)
            }
        }
    }
    
    func authMobGet(credentials: Credentials,
                  failure: @escaping ((Any) -> Void),
                  success: @escaping Success<Any>) {
        
        let parameters = ["login": credentials.login,
                          "password": credentials.password]
        
        NetworkManager.shared.fetchData(from: "/auth/mobile", parameters: parameters, method: .get) { result in
            
            switch result {
            case .success(let data):
                // обработать данные
                success(data)
                
            case .failure(let error):
                
                // Обработать ошибку
                print(error.localizedDescription)
            }
        }
    }
    
}


