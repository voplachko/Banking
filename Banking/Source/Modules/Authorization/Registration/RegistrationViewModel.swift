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
        registrationWorker.createAccount(credentials: Credentials(login: userNumber, email: userEmail),
                                    failure: { error in
         // занимаемся обработкой ошибки
            print((error as? NSError).localizedDescription)
        },
                                    success: { result in
            // отправляем запрос на activateAccount
            self.activateAccount()
        })
    }
    
    // Реализовать функцию activateAccount по аналогии c registerUser
    func activateAccount() {
        // при успехе в блоке success отправить запрос на setPassword
        registrationWorker.activateAccount(credentials: Credentials(login: userNumber, email: userEmail),
                                    failure: { error in
            print((error as? NSError).localizedDescription)
         // занимаемся обработкой ошибки
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
        registrationWorker.setPassword(credentials: Credentials(login: userNumber, email: userEmail),
                                    failure: { error in
            print((error as? NSError).localizedDescription)
         // занимаемся обработкой ошибки
        },
                                    success: { result in
            
            self.setPassword()
        })
    }
}
