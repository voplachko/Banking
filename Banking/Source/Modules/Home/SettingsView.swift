//
//  FourthScreen.swift
//  Banking
//
//  Created by Всеволод Оплачко on 21.07.2024.
//

import SwiftUI
import LocalAuthentication

struct SettingsView: View {
    
    @AppStorage("kIsUserAuthorized") var isUserAuthorized: Bool = false
    
    @State private var currentLanguage: String = "English"
    @State private var isBiometricEnabled: Bool = false
    @State private var isAuthenticated: Bool = false
    @State private var authError: String? = nil
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("Back_Icon")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .opacity(0)
                    
                    Spacer()
                    
                    Text("Settings")
                        .font(.custom("Poppins", size: 18))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image("LogOut-Icon")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .onTapGesture {
                            UserDefaultsWrapper.userAccount = nil
                            UserDefaultsWrapper.isSeenOnboarding = false
                            isUserAuthorized = false
                        }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 31)
                
                Text("General")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.grayExtra)
                    .padding(.leading, 20)
                    .padding(.bottom, 31)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                NavigationLink(destination: LanguageSelectionView(currentLanguage: $currentLanguage)) {
                    HStack {
                        Text("Language")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(currentLanguage)
                            .font(.custom("Poppins", size: 14))
                            .foregroundColor(.grayExtra)
                            .padding(.trailing, 16)
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundColor(.grayExtra)
                    }
                    .padding(.horizontal, 20)
                }
                
                Divider()
                    .padding(.horizontal, 20)
                
                NavigationLink(destination: ProfileView()) {
                    HStack {
                        Text("My Profile")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundColor(.grayExtra)
                    }
                    .padding(.horizontal, 20)
                }
                
                Divider()
                    .padding(.horizontal, 20)
                
                NavigationLink(destination: ContactUsView()) {
                    HStack {
                        Text("Contact Us")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundColor(.grayExtra)
                    }
                    .padding(.horizontal, 20)
                    
                }
                
                Divider()
                    .padding(.horizontal, 20)
                
                Text("Security")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.grayExtra)
                    .padding(.leading, 20)
                    .padding(.top, 31)
                    .padding(.bottom, 31)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Change Password")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 15)
                        .foregroundColor(.grayExtra)
                }
                .padding(.horizontal, 20)
                
                Divider()
                    .padding(.horizontal, 20)
                
                HStack {
                    Text("Privacy Policy")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 15)
                        .foregroundColor(.grayExtra)
                }
                .padding(.horizontal, 20)
                
                Divider()
                    .padding(.horizontal, 20)
                
                Text("Choose what data you share with us")
                    .padding(.horizontal, 20)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.grayProfile)
                
                HStack {
                    Text("Biometric")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isBiometricEnabled)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                        .frame(width: 35, height: 20)
                        .onChange(of: isBiometricEnabled) { value in
                            if value {
                                authenticate()
                            } else {
                                isAuthenticated = false
                            }
                        }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .background(Color.bankingPrimary)
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // Check if the device supports biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to enable Biometric Authentication"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        isAuthenticated = true
                    } else {
                        isBiometricEnabled = false
                        authError = authenticationError?.localizedDescription
                    }
                }
            }
        } else {
            // No biometry available
            isBiometricEnabled = false
            authError = error?.localizedDescription
        }
    }
}

struct LanguageSelectionView: View {
    
    @Binding var currentLanguage: String
    let languages = ["English", "Spanish", "French", "German", "Russian"]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List(languages, id: \.self) { language in
            Button(action: {
                currentLanguage = language
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Text(language)
                        .font(.custom("Poppins", size: 14))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    if language == currentLanguage {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
            }
            .listRowBackground(Color.bankingPrimary)
        }
        .background(Color.bankingPrimary.edgesIgnoringSafeArea(.all))
//        .navigationTitle("Select Language")
        .listStyle(PlainListStyle())
    }
}

struct ContactUsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action:  {
                    dismiss()
                }) {
                    Image("Back_Icon")
                        .frame(width: 42, height: 42)
                        .padding(.leading, 20)
                }
                
                Spacer()
                                
                Text("Contact Us")
                    .font(.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("Edit-Icon")
                    .frame(width: 42, height: 42)
                    .padding(.trailing, 20)
                    .opacity(0)
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, safeAreaInsets().top)
            
            
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
        
}

#Preview {
    SettingsView()
}
