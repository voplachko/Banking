//
//  CardItem.swift
//  Banking
//
//  Created by Всеволод Оплачко on 31.07.2024.
//

import Foundation
import SwiftData

@Model class CardItem: Identifiable {
    var id: UUID
    var pan: String
    var cardHolder: String
    var expDate: String
    var cvv: String
    
    init(id: UUID = UUID(), pan: String, cardHolder: String, expDate: String, cvv: String) {
        self.id = id
        self.pan = pan
        self.cardHolder = cardHolder
        self.expDate = expDate
        self.cvv = cvv
    }
}


