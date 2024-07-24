//
//  HomeViewModel.swift
//  Banking
//
//  Created by Всеволод Оплачко on 23.07.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    fileprivate var historyWorker: HistoryWorker = .init()
    
    @Published var operations: [UserHistory] = []
    
    
    
    public func getHistory() {
        historyWorker.getHistory(
                                 short: false,
                                 token: UserDefaultsWrapper.userAccount?.token ?? "",
                                 failure: { error in
                                     print("loading failure")
                                     
                                     print(error as? NSError)?.localizedDescription ?? "empty")
                                     
            
        },
                                 success: { operations in
                                     self.operations = operations
        })
    }
}
