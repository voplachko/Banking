//
//  SendMoneyView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 31.07.2024.
//

import SwiftUI
import SwiftData
import ContactsUI

var transactions: [Transaction] = []

struct SendMoneyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Query var cardItems: [CardItem]
    
    @State private var selectedCardPan: String = ""
    
    @State private var showAlert: Bool = false
    @State private var moneyAmount: String = ""
    @State private var selectedCurrency: String = Currency.KZT.rawValue
    @State private var showCurrencyPicker: Bool = false
    @State private var showContactPicker: Bool = false
    @State private var showSuccessView: Bool = false
    
    @State private var isContactSelected: Bool = false
    
    let currencies: [String] = [Currency.KZT.rawValue,
                                  Currency.EUR.rawValue,
                                  Currency.USD.rawValue,
                                  Currency.GBP.rawValue,
                                  Currency.RUB.rawValue]
    
    @State private var recipientsOfMoney: [Recipient] = []
    @State private var selectedRecipient: Recipient? = nil
    
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
            
            ScrollView {
                TabView {
                    ForEach(cardItems, id: \.id) { card in
                        CardWidget(pan: card.pan,
                                   cvv: card.cvv,
                                   cardHolder: card.cardHolder,
                                   expDate: card.expDate,
                                   cardSystem: "Mastercard",
                                   chip: "SIM",
                                   waves: "ContectlessPayment")
                        .tag(card.pan)
                        .onTapGesture {
                            selectedCardPan = card.pan
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(minHeight: 300)
                
                
                VStack {
                    Text("Send to")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 15)
                        .padding(.leading, 12)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            VStack {
                                Button(action: {
                                    showContactPicker = true
                                }) {
                                    
                                    Image("Add-Icon")
                                        .frame(width: 48, height: 48)
                                }
                                
                                Text("Add")
                                    .font(.custom("Poppins", size: 11))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.white)
                                
                            }
                            
                            
                            
                            ForEach(recipientsOfMoney, id: \.id) { recipient in
                                VStack {
                                    Image(recipient.avatar)
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .clipShape(Circle())
                                        .onTapGesture {
                                            selectedRecipient = recipient
                                        }
                                    
                                    Text(recipient.name)
                                        .font(.custom("Poppins", size: 11))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.white)
                                }
                                
                            }
                            
                        }
                        .padding(.horizontal, 12)
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                    }
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
                
                sendMoney()
                
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
        .sheet(isPresented: $showContactPicker) {
            ContactPickerView { contactName, contactImage in
                let recipient = Recipient(name: contactName, avatar: "Vova")
                recipientsOfMoney.append(recipient)
            }
        }
        .fullScreenCover(isPresented: $showSuccessView) {
            SuccessView(transaction: transactions.last!)
        }
    }
    
    private func sendMoney() {
        guard !selectedCardPan.isEmpty,
              let _ = cardItems.first(where: { $0.pan == selectedCardPan }),
              let _ = selectedRecipient,
              let amount = Double(moneyAmount), amount > 0 else {
            showAlert = true
            return
        }
            
        let selectedCard = cardItems.first(where: { $0.pan == selectedCardPan })!
        let transaction = Transaction(status: .success,
                                      amount: amount,
                                      currency: Currency(rawValue: selectedCurrency) ?? .USD,
                                      card: selectedCard,
                                      recipientsOfMoney: recipientsOfMoney) 
            
        transactions.append(transaction)
        showSuccessView = true
    }
    
}

struct ContactPickerView: UIViewControllerRepresentable {
    var onContactSelected: (String, UIImage?) -> Void
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onContactSelected: onContactSelected)
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        var onContactSelected: (String, UIImage?) -> Void
        
        init(onContactSelected: @escaping (String, UIImage?) -> Void) {
            self.onContactSelected = onContactSelected
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            let firstName = contact.givenName
            let imageData = contact.thumbnailImageData
            let image = imageData != nil ? UIImage(data: imageData!) : nil
            onContactSelected(firstName, image)
        }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {}
    }
}

#Preview {
    SendMoneyView()
        .modelContainer(for: CardItem.self)
}



enum TransactionStatus: Int {
    case success = 1
    case failure = 0
}

enum Currency: String {
    case USD = "USD"
    case KZT = "KZT"
    case EUR = "EUR"
    case GBP = "GBP"
    case RUB = "RUB"
}

struct Transaction {
    let id: UUID = .init()
    var status: TransactionStatus?
    let amount: Double
    let currency: Currency
    let card: CardItem
    let recipientsOfMoney: [Recipient]
}

struct Recipient {
    let id: UUID = .init()
    var name: String
    var avatar: String
}
