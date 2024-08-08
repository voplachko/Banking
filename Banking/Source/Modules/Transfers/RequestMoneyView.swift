//
//  RequestMoneyView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 31.07.2024.
//

import SwiftUI
import SwiftData

struct RequestMoneyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert: Bool = false
    @State private var moneyAmount: String = ""
    @State private var payerName: String = ""
    @State private var emailAddress: String = ""
    @State private var description: String = ""
    @State private var day: String = ""
    @State private var month: String = ""
    @State private var year: String = ""
    @State private var selectedCurrency: String = "KZT"
    @State private var showCurrencyPicker: Bool = false
    
    let currencies = ["KZT", "USD", "EUR", "GBP", "RUB"]
    
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
                
                Text("Request Money")
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
            
            ScrollView {
                VStack {
                    
                    Text("Payer Name")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.grayExtra)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Image("Icon_User")
                        
                        TextField("", text: $payerName)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                    }
                    
                    Divider()
                    
                    Spacer().frame(height: 21)
                    
                    Text("Email Address")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.grayExtra)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Image("Icon_Email")
                        
                        TextField("", text: $emailAddress)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                    }
                    
                    Divider()
                    
                    Spacer().frame(height: 21)
                    
                    Text("Description")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.grayExtra)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Image("Icon_User")
                        
                        TextField("", text: $description)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                    }
                    
                    Divider()
                    
                    Spacer().frame(height: 21)
                    
                    Text("Monthly Due By")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.grayExtra)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        TextField("dd", text: $day)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        TextField("mm", text: $month)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        TextField("yy", text: $year)
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                    }
                    
                    Spacer().frame(height: 30)
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 30)
                
                VStack {
                    HStack {
                        Text("Enter Your Amount")
                            .font(.custom("Poppins", size: 11))
                            .fontWeight(.regular)
                            .foregroundStyle(Color.currencyColor)
                            .padding(.top, 30)
                            .padding(.leading, 12)
                        
                        Spacer()
                        
                        Button(action: {
                            showCurrencyPicker.toggle()
                        }) {
                            Text("Change Currency?")
                                .font(.custom("Poppins", size: 11))
                                .fontWeight(.regular)
                                .foregroundStyle(Color.currencyRedColor)
                                .padding(.top, 30)
                                .padding(.trailing, 12)
                        }
                    }
                    
                    if showCurrencyPicker {
                        Picker("Select Currency", selection: $selectedCurrency) {
                            ForEach(currencies, id: \.self) { currency in
                                Text(currency).tag(currency)
                                    .foregroundColor(Color.currencyColor)
                                    .font(.custom("Poppins", size: 14))
                                    .fontWeight(.semibold)
                            }
                        }
                        .pickerStyle(.wheel)
                        .background(Color.blockColor)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    }
                    
                    HStack {
                        Text(selectedCurrency)
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
            }
            
            
            Spacer()
            
            
            Button(action: {
                
                
                
            }) {
                Text("Request Money")
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
    RequestMoneyView()
}
