//
//  AllCardsView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 24.07.2024.
//

import SwiftUI
import SwiftData

struct AllCardsView: View {
    
    @Query var cardItems: [CardItem]
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowAddCard: Bool = false
    
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
            
//            ScrollView {
//                ForEach(cardItems, id: \.id) { card in
//                    CardWidget(pan: card.pan,
//                               cvv: card.cvv,
//                               cardHolder: card.cardHolder,
//                               expDate: card.expDate,
//                               cardSystem: "Mastercard",
//                               chip: "SIM",
//                               waves: "ContactlessPayment")
//                    .padding(.top, 30)
//                }
//            }
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    isShowAddCard = true
                }
            }) {
                Text("Add Card")
                    .font(.custom("Poppins", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background(Color.blue)
                    .cornerRadius(16)
                
                Spacer()
            }
            .frame(height: 56)
            .padding(.horizontal, 20)
        }
        .background(Color.bankingPrimary)
        .fullScreenCover(isPresented: $isShowAddCard) {
            AddCardView()
        }
    }
}

#Preview {
    AllCardsView()
        .modelContainer(for: CardItem.self)
}
