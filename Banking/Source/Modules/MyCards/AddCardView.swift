//
//  AddCardView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 24.07.2024.
//

import SwiftUI
import SwiftData

struct AddCardView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Environment(\.dismiss) private var dismiss
    
    @State var pan: String = "4562112245957852"
    @State var cvv: String = "696"
    @State var cardHolder: String = "NIKITA NIKITIN"
    @State var expDate: String = "06/2026"
    @State var cardSystem: String = "Mastercard"
    @State var chip: String = "SIM"
    @State var waves: String = "ContactlessPayment"
    
    var body: some View {
        VStack {
            HStack {
                Button(action:  {
                    dismiss()
                }) {
                    Image("Back_Icon")
                        .resizable()
                        .frame(width: 42, height: 42)
                }
                Spacer()
                
                Text("All Cards")
                    .font(.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image("Back_Icon")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .opacity(0)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            CardWidget(pan: "535254252524525",
                       cvv: "533",
                       cardHolder: "Bogdan Shmatov",
                       expDate: "11/2030",
                       cardSystem: "Mastercard",
                       chip: "SIM",
                       waves: "ContactlessPayment")
            .padding(.top, 30)
            
            VStack(spacing: 21) {
                
            }
            
            Button("Save") {
                // check that pan, cvv, name not empty, then call addCard()
                addCard()
            }
            
            Spacer()
            
        }
        .background(Color.bankingPrimary)
    }
    
    func addCard() {
        
        let cardItem = CardItem(pan: pan,
                                cardHolder: cardHolder,
                                expDate: expDate,
                                cvv: cvv)
        
        modelContext.insert(cardItem)
    }
}

#Preview {
    AddCardView()
        .modelContainer(for: CardItem.self)
}


@Model class CardItem: Identifiable {
    let id: UUID
    let pan: String
    let cardHolder: String
    let expDate: String
    let cvv: String
    
    init(id: UUID = .init(), pan: String, cardHolder: String, expDate: String, cvv: String) {
        self.id = id
        self.pan = pan
        self.cardHolder = cardHolder
        self.expDate = expDate
        self.cvv = cvv
    }
}
