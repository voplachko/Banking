//
//  AllCardsView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 24.07.2024.
//

import SwiftUI
import SwiftData

struct AllCardsView: View {
    
    @Query private var cardItems: [CardItem]
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var isShowAddCard: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    @State private var cardToDelete: CardItem?
    
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
                    .foregroundColor(.white)
                
                Spacer()
                
                // Placeholder to balance the layout
                Image("Back_Icon")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .opacity(0)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            
            List {
                ForEach(cardItems, id: \.id) { card in
                    CardWidget(
                        pan: card.pan,
                        cvv: card.cvv,
                        cardHolder: card.cardHolder,
                        expDate: card.expDate,
                        cardSystem: "Mastercard",
                        chip: "SIM",
                        waves: "ContactlessPayment"
                    )
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 10)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            cardToDelete = card
                            showDeleteConfirmation = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(Color.bankingPrimary)
            
            Button(action: {
                withAnimation {
                    isShowAddCard = true
                }
            }) {
                Text("Add Card")
                    .font(.custom("Poppins", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(16)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.bankingPrimary.edgesIgnoringSafeArea(.all))
        .fullScreenCover(isPresented: $isShowAddCard) {
            AddCardView()
        }
        .alert(isPresented: $showDeleteConfirmation) {
            Alert(
                title: Text("Delete Card"),
                message: Text("Are you sure you want to delete this card?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let card = cardToDelete {
                        deleteCard(card)
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    
    private func deleteCard(_ card: CardItem) {
        withAnimation {
            modelContext.delete(card)
            cardToDelete = nil
        }
    }
}

#Preview {
    AllCardsView()
        .modelContainer(for: CardItem.self)
}
