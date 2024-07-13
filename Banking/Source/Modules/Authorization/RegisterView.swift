//
//  AuthorizationView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 12.07.2024.
//

import SwiftUI

struct RegisterView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var userName: String = ""
    @State var userNumber: String = ""
    
    @State private var isPasswordVisible: Bool = false
    @State private var showAlert: Bool = false
    
    private let emailIconName = "Icon_Email"
    private let passwordIconName = "Icon_Password"
    private let userIconName = "Icon_User"
    private let phoneIconName = "Icon_Phone"
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action:  {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, safeAreaInsets().top)
            
            Spacer().frame(height: 53)
            
            Text("Sign Up")
                .font(.custom("Poppins", size: 32))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
            
            Spacer().frame(height: 38)
            
            VStack {
                Text("Full Name")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.grayExtra)
                
                UnderlineTextFieldView(
                    text: $userName,
                    textFieldView: userNameView,
                    placeholder: "Full Name",
                    imageName: userIconName)
                    .padding(.top, 15)
                
                Text("Phone Number")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.grayExtra)
                
                UnderlineTextFieldView(
                    text: $userNumber,
                    textFieldView: phoneNumberView,
                    placeholder: "+",
                    imageName: phoneIconName)
                    .padding(.top, 15)
                
                Text("Email Address")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.grayExtra)
                
                
                UnderlineTextFieldView(
                    text: $userEmail,
                    textFieldView: textView,
                    placeholder: "Email Address",
                    imageName: emailIconName)
                    .padding(.top, 15)
                
                Text("Password")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 21)
                    .foregroundColor(Color.grayExtra)
                
                UnderlineTextFieldView(
                    text: $userPassword,
                    textFieldView: passwordView,
                    placeholder: "Password",
                    imageName: passwordIconName)
                    .padding(.top, 15)
                                
                        
            }
            
            Spacer().frame(height: 40)
            
            Button(action: {
                withAnimation {
                    if userEmail.isEmpty || userPassword.isEmpty || userName.isEmpty || userNumber.isEmpty {
                        showAlert = true
                    } else {
                        dismiss()
                    }
                }
                
            }) {
                Text("Sign in")
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
            
            Spacer().frame(height: 29)
            
            HStack {
                Text("Already have an account.")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color.grayExtra)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Sign In")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                    }
            }
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
        .ignoresSafeArea(.all)
    }
}

extension RegisterView {
    
    private var textView: some View {
        TextField("", text: $userEmail)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    
    private var userNameView: some View {
        TextField("", text: $userName)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .autocapitalization(.none)
    }
    
    private var phoneNumberView: some View {
        TextField("", text: $userNumber)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .autocapitalization(.none)
    }
    
    private var passwordView: some View {
        HStack {
            if isPasswordVisible {
                TextField("", text: $userPassword)
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 14))
            } else {
                SecureField("", text: $userPassword)
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 14))
            }
            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
    }
}


#Preview {
    AuthorizationView()
}
