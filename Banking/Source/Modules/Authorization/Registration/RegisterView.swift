//
//  AuthorizationView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 12.07.2024.
//

import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel: RegistrationViewModel = .init()
    
    @State private var isPasswordVisible: Bool = false
    
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
            
            Spacer().frame(height: 30)
            
            Text("Sign Up")
                .font(.custom("Poppins", size: 32))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
            
            Spacer().frame(height: 38)
            
            ScrollView {
                VStack(spacing: 21) {
                    VStack {
                        Text("Full Name")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
    //                        .padding(.top, 21)
                            .foregroundColor(Color.grayExtra)
                        
                        UnderlineTextFieldView(
                            text: $viewModel.userName,
                            textFieldView: userNameView,
                            placeholder: "Full Name",
                            imageName: "Icon_User")
                            .padding(.top, 15)
                    }
                    
                    VStack {
                        Text("Phone Number")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        //                        .padding(.top, 21)
                            .foregroundColor(Color.grayExtra)
                        
                        UnderlineTextFieldView(
                            text: $viewModel.userNumber,
                            textFieldView: phoneNumberView,
                            placeholder: "+",
                            imageName: "Icon_Phone")
                        .padding(.top, 15)
                    }
                    
                    VStack {
                        Text("Email Address")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        //                        .padding(.top, 21)
                            .foregroundColor(Color.grayExtra)
                        
                        
                        UnderlineTextFieldView(
                            text: $viewModel.userEmail,
                            textFieldView: textView,
                            placeholder: "Email Address",
                            imageName: "Icon_Email")
                        .padding(.top, 15)
                    }
                    VStack {
                        Text("Password")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        //                        .padding(.top, 21)
                            .foregroundColor(Color.grayExtra)
                        
                        UnderlineTextFieldView(
                            text: $viewModel.userPassword,
                            textFieldView: passwordView,
                            placeholder: "Password",
                            imageName: "Icon_Password")
                        .padding(.top, 15)
                    }
                            
                }
            }
            
            Button(action: {
                withAnimation {
                    if viewModel.validateParams() {
                        viewModel.showAlert = true
                    } else {
//                        dismiss()
                        // TODO: send request on register
                         viewModel.registerUser()
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
            .alert(isPresented: $viewModel.showAlert) {
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
            .padding(.bottom, 24)
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
        .ignoresSafeArea(.all)
    }
}

extension RegisterView {
    
    private var textView: some View {
        TextField("", text: $viewModel.userEmail)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    
    private var userNameView: some View {
        TextField("", text: $viewModel.userName)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .autocapitalization(.none)
    }
    
    private var phoneNumberView: some View {
        TextField("", text: $viewModel.userNumber)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .autocapitalization(.none)
    }
    
    private var passwordView: some View {
        HStack {
            if isPasswordVisible {
                TextField("", text: $viewModel.userPassword)
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 14))
            } else {
                SecureField("", text: $viewModel.userPassword)
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
    RegisterView()
}
