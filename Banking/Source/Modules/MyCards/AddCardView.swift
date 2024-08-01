//
//  AddCardView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 24.07.2024.
//

import SwiftUI
import SwiftData

struct AddCardView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var cardHolderName: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var cardNumber: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
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
            
            CardWidget(pan: $cardNumber,
                       cvv: $cvv,
                       cardHolder: $cardHolderName,
                       expDate: $expiryDate,
                       cardSystem: "Mastercard",
                       chip: "SIM",
                       waves: "ContactlessPayment")
            .padding(.top, 30)
            
            VStack() {
                
                Text("Cardholer Name")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.grayExtra)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Image("Icon_User")
                        
                    TextField("", text: $cardHolderName)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                        .foregroundStyle(.white)
                }
                
                Divider()
                
                Spacer().frame(height: 21)
                
                HStack {
                    VStack {
                        Text("Expiry Date")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(.grayExtra)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        TextField("", text: $expiryDate)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            
                        Divider()
                            .padding(.trailing, 70)
                    }
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("3-digit CVV")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(.grayExtra)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $cvv)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                        
                        Divider()
                            
                    }
                    .padding(.leading, 50)
                    
                }
                
                Spacer().frame(height: 21)

                Text("Card Number")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.grayExtra)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Image("Card_Icon")
                    
                    TextField("", text: $cardNumber)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                        .foregroundStyle(.white)
                }
                
                Divider()
                    
            }
            .padding(.top, 30)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            Spacer()
            
            Button(action: {
                
                withAnimation {
                    if cardHolderName.isEmpty || expiryDate.isEmpty || cvv.isEmpty || cardNumber.isEmpty {
                        showAlert = true
                    } else {
                        addCard()
                        
                        dismiss()
                    }
                }
                
            }) {
                Text("Add Card")
                    .font(.custom("Poppins", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background(Color.blue)
                    .cornerRadius(16)
                    
            }
            .frame(height: 56)
            .padding(.horizontal, 20)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields correctly."),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            Spacer()
        }
        .background(Color.bankingPrimary)
    }
    
    func addCard() {
        
        let cardItem = CardItem(
                                
                                pan: cardNumber,
                                cardHolder: cardHolderName,
                                expDate: expiryDate,
                                cvv: cvv
        )
        
        modelContext.insert(cardItem)
    }
}

#Preview {
    AddCardView()
}
