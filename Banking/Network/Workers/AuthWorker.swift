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
                  success: @escaping Success<UserAccount>) {
        
        let parameters = ["login": credentials.login,
                          "password": credentials.password]
        
        let headers: [String: String] = [
            "partner-name": "wooppay_app_kz",
            "X-Application-Key": "YWdlbnRvbGVn",
            "Content-Type": "application/json"
        ]
        
        NetworkManager.shared.fetchData(from: "auth/mobile",
                                        parameters: parameters,
                                        headers: headers,
                                        method: .post) { result in
            
            switch result {
            case .success(let data):
                // обработать данные
                
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    
                    // Превратили JSON в  нашу Структуру
                    let result: UserAccount = try jsonDecoder.decode(UserAccount.self, from: data)
                    
                    success(result)
                    
                } catch {
                    print("Error:\(error)")
                }

                
            case .failure(let error):
                
                // Обработать ошибку
                print(error.localizedDescription)
            }
        }
    }
    
    func authMobGet(credentials: Credentials,
                    token: String,
                    failure: @escaping ((Any) -> Void),
                    success: @escaping Success<UserAccount>) {
        
        let parameters = ["login": credentials.login,
                          "password": credentials.password]
        
        let headers: [String: String] = [
            "partner-name": "wooppay_app_kz",
            "X-Application-Key": "YWdlbnRvbGVn",
            "Content-Type": "application/json",
            "Authorization": token
        ]
        
        NetworkManager.shared.fetchData(from: "auth/mobile",
                                        parameters: parameters,
                                        headers: headers,
                                        method: .get) { result in
            
            switch result {
            case .success(let data):
                // обработать данные
              
                do {
                    let jsonDecoder = JSONDecoder()
                    
                    // Превратили JSON в  нашу Структуру
                    let result: UserAccount = try jsonDecoder.decode(UserAccount.self, from: data)
                    
                    success(result)
                    
                } catch {
                    print("Error:\(error)")
                }
                
            case .failure(let error):
                
                // Обработать ошибку
                print(error.localizedDescription)
            }
        }
    }
    
}


