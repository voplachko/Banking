//
//  AddCardView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 24.07.2024.
//

import SwiftUI

struct AddCardView: View {
    
    @Environment(\.dismiss) private var dismiss
    
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
            
            Spacer()
            
        }
        .background(Color.bankingPrimary)
    }
}

#Preview {
    AddCardView()
}
