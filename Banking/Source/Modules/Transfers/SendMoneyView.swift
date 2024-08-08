//
//  SendMoneyView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 31.07.2024.
//

import SwiftUI
import SwiftData
import ContactsUI

struct SendMoneyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert: Bool = false
    @State private var moneyAmount: String = ""
    @State private var selectedCurrency: String = "KZT"
    @State private var showCurrencyPicker: Bool = false
    @State private var showContactPicker: Bool = false
    @State private var selectedContacts: [(name: String, image: UIImage?)] = []
    
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
                            
                            
                            
                            ForEach(selectedContacts, id: \.name) { contact in
                                VStack {
                                    if let image = contact.image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                    } else {
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                    }
                                    
                                    Text(contact.name)
                                        .font(.custom("Poppins", size: 11))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.white)
                                }
                                
                            }
                            
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
                selectedContacts.append((name: contactName, image: contactImage))
            }
        }
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
}
