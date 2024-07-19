//
//  AuthorizationView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 12.07.2024.
//

import SwiftUI

struct AuthorizationView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showAlert: Bool = false
    @State private var isShowProfileView: Bool = false
    @State private var isShowRegisterView: Bool = false
    
    private let emailIconName = "Icon_Email"
    private let passwordIconName = "Icon_Password"
    
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
                        .padding(.leading, 20)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, safeAreaInsets().top)
            
            Spacer().frame(height: 53)
            
            Text("Sign In")
                .font(.custom("Poppins", size: 32))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
            
            Spacer().frame(height: 38)
            
            VStack {
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
                    if userEmail.isEmpty || userPassword.isEmpty {
                        showAlert = true
                    } else {
                        isShowProfileView = true
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
                Text("I'm a new user.")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color.grayExtra)
                
                Button(action: {
                    isShowRegisterView = true
                }) {
                    Text("Sign Up")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                    }
            }
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
        .ignoresSafeArea(.all)
        .fullScreenCover(isPresented: $isShowProfileView) {
            ProfileView()
        }
        .fullScreenCover(isPresented: $isShowRegisterView) {
            RegisterView()
        }
    }
}

extension AuthorizationView {
    
    private var textView: some View {
        TextField("", text: $userEmail)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .keyboardType(.emailAddress)
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
