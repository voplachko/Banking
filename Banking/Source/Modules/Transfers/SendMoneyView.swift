//
//  SendMoneyView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 31.07.2024.
//

import SwiftUI
import SwiftData

struct SendMoneyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert: Bool = false
    @State private var moneyAmount: String = ""
    
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
                
                Text("Send Money")
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
            
            // TabView {
            //      ForEach { cards in
            //              CardWidget()
            //              show all cards?
            
            Image("Card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            
            VStack {
                Text("Send to")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 15)      // Отступ сверху от фона
                    .padding(.leading, 12)
                
                //TabView c перелистыванием контактов горизонтально
                
                HStack {
                    VStack {
                        Image("Add-Icon")
                            .frame(width: 48, height: 48)
                        
                        Text("Add")
                            .font(.custom("Poppins", size: 11))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image("Tyler")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        Text("Tyler")
                            .font(.custom("Poppins", size: 11))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image("Ivan")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        Text("Ivan")
                            .font(.custom("Poppins", size: 11))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image("Vova")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        Text("Vova")
                            .font(.custom("Poppins", size: 11))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image("Ryan")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        Text("Ryan")
                            .font(.custom("Poppins", size: 11))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 15)
                .padding(.bottom, 15)
            }
            .padding(.horizontal, 32)
            .background(
                Color.blockColor
                    .cornerRadius(14)
                    .padding(.horizontal, 20)
            )
            
            Spacer().frame(height: 30)
            
            VStack {
                HStack {
                    Text("Enter Your Amount")
                        .font(.custom("Poppins", size: 11))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.currencyColor)
                        .padding(.top, 30)
                        .padding(.leading, 12)
                    
                    Spacer()
                    
                    Text("Change Currency?")
                        .font(.custom("Poppins", size: 11))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.currencyRedColor)
                        .padding(.top, 30)
                        .padding(.trailing, 12)
                }
                
                HStack {
                    Text("KZT")
                        .font(.custom("Poppins", size: 24))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.currencyColor)
                        
                    
                    TextField("0.0", text: $moneyAmount)
                        .font(.custom("Poppins", size: 24))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 12)
                .padding(.top, 15)
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 32)
            .background(
                Color.blockColor
                    .cornerRadius(14)
                    .padding(.horizontal, 20)
            )
            
            
            Spacer()
            
            
            Button(action: {
                
                
                
            }) {
                Text("Send Money")
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
            
        }
        .background(Color.bankingPrimary)
    }
}

#Preview {
    SendMoneyView()
}
