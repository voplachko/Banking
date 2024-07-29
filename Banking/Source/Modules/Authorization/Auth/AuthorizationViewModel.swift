//
//  AuthorizationViewModel.swift
//  Banking
//
//  Created by Всеволод Оплачко on 19.07.2024.
//

import SwiftUI

class AuthorizationViewModel: ObservableObject {
    
    @AppStorage("kIsUserAuthorized") var isUserAuthorized: Bool = false
    
    
    fileprivate var authWorker: AuthWorker = .init()
    
    func signIn(credentials: Credentials) {
        authWorker.authMobPost(credentials: credentials,
                               failure: { error in
            // обрабатывать ошибку клиенте (показать валидационную ошибку, алерт  и тд)
        },
                               success: { user in
            UserDefaultsWrapper.userAccount = user
            
            DispatchQueue.main.async {
                self.isUserAuthorized = true
            }
            
            // показать главный экран
        })
    }
}
