//
//  RegistrationWorker.swift
//  Banking
//
//  Created by Всеволод Оплачко on 17.07.2024.
//

import Foundation

typealias Failure = (Any) -> Void
typealias Success<T> = (T) -> Void

final class RegistrationWorker {
    
    // Success<Any> использую,  когда не важно, что придет в ответе, главное чтобы сервер ответил успешно, просто вызываю !
    
    // Success<StructureName> использую, чтобы спарсить Json в необходимую структуру  !
    
    // Если получаем респонс с сервера и нам нужно его сохранить для дальнейшей работы - используем декодер вот так:
//                    do {
//
//                        let jsonDecoder = JSONDecoder()
//
//                        // Превратили JSON в  нашу Структуру
//                        let result: Premerchant = try jsonDecoder.decode(StructureName.self, from: data)
//
//                        success(result)
//
//                    } catch {
//                        print("Error:\(error)")
//                    }
    
    func createAccount(credentials: Credentials,
                  failure: @escaping ((Any) -> Void),
                  success: @escaping Success<Any>) {
        
        let parameters = ["login": credentials.login,
                          "email": credentials.email]
        
        NetworkManager.shared.fetchData(from: "/registration/create-account", parameters: parameters, method: .post) { result in
            
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
    
    
    // Сменить from на тот, что в доке для activate-account
    func activateAccount(credentials: Credentials,
                         failure: @escaping ((Any) -> Void),
                         success: @escaping Success<Any>) {
        
        let parameters = ["login": credentials.login,
                          "activation_code": "111111"]
        
        NetworkManager.shared.fetchData(from: "/registration/activate-account", parameters: parameters, method: .post) { result in
            
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
    
    // Реализовать func setPassword() {}
    // Не забудь про success, failure и другие необходимые параметры в сигнатуре
    
    func setPassword(credentials: Credentials,
                     failure: @escaping ((Any) -> Void),
                     success: @escaping Success<Any>) {
        
        let parameters = ["login": credentials.login,
                          "activation_code": "111111",
                          "password": "f58Ydz2km"]
        
        NetworkManager.shared.fetchData(from: "/registration/set-password", parameters: parameters, method: .post) { result in
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


