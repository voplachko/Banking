//
//  RegistrationViewModel.swift
//  Banking
//
//  Created by Всеволод Оплачко on 17.07.2024.
//

import SwiftUI

public struct Credentials {
    let login: String
    let email: String
    let password: String
}

class RegistrationViewModel: ObservableObject {
    
    fileprivate var registrationWorker = RegistrationWorker()
    
    @Published var userEmail: String = ""
    @Published var userPassword: String = ""
    @Published var userName: String = ""
    @Published var userNumber: String = ""

    @Published var showAlert: Bool = false
}

extension RegistrationViewModel {
    func validateParams() -> Bool {
        return userEmail.isEmpty || userPassword.isEmpty || userName.isEmpty || userNumber.isEmpty
    }
}

extension RegistrationViewModel {
    
    func registerUser() {
        registrationWorker.createAccount(credentials: Credentials(login: userNumber, email: userEmail, password: userPassword),
                                    failure: { error in
         // занимаемся обработкой ошибки
            if let error = error as? NSError {
                print(error.localizedDescription)
            }
            self.showAlert = true
        },
                                    success: { result in
            // отправляем запрос на activateAccount
            self.activateAccount()
        })
    }
    
    // Реализовать функцию activateAccount по аналогии c registerUser
    func activateAccount() {
        // при успехе в блоке success отправить запрос на setPassword
        registrationWorker.activateAccount(credentials: Credentials(login: userNumber, email: userEmail, password: userPassword),
                                    failure: { error in
            if let error = error as? NSError {
                print(error.localizedDescription)
            }         // занимаемся обработкой ошибки
            self.showAlert = true
        },
                                    success: { result in
            
            self.setPassword()
        })
    }
    
    // Реализовать функцию setPassword по аналогии c registerUser и activateAccount
    func setPassword() {
        // при успехе на этот запрос:
        // сохраняем данные если необходимо
        // показываем другой экран
        // сценарий после успешной регистрации
        registrationWorker.setPassword(credentials: Credentials(login: userNumber, email: userEmail, password: userPassword),
                                    failure: { error in
            if let error = error as? NSError {
                print(error.localizedDescription)
            }
            self.showAlert = true
         // занимаемся обработкой ошибки
        },
                                    success: { result in
            
        })
    }
}
