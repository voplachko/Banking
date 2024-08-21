//
//  ProfileView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 13.07.2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    let profileItems: [(image: String, text: String)] = [
            ("Icon_User", "Personal Information"),
            ("Icon_Payment", "Payment Preferences"),
            ("Icon_Cards", "Banks and Cards"),
            ("Icon_Notifications", "Notifications"),
            ("Icon_Message", "Message Center"),
            ("Icon_Address", "Address"),
            ("Icon_Settings", "Settings")
        ]
    
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
                                
                Text("Profile")
                    .font(.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("Edit-Icon")
                    .frame(width: 42, height: 42)
                    .padding(.trailing, 20)
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, safeAreaInsets().top)
            
            Spacer().frame(height: 32)
            
            HStack {
                Image("Boss")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    Text("Bogdan Shmatov")
                        .font(.custom("Poppins", size: 17))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text("iOS Dev Teamlead")
                        .font(.custom("Poppins", size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(Color.grayProfile)
                }
                .padding(.leading, 22)
                
                Spacer()
            }
            
            Spacer().frame(height: 32)
            
            ScrollView {
                VStack {
                    ForEach(profileItems, id: \.text) { item in
                        HStack {
                            Image(item.image)
                                .frame(width: 22, height: 22)
                                .padding(.leading, 20)
                            
                            Text(item.text)
                                .font(.custom("Poppins", size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                            
                            Spacer()
                            
                            if item.text == "Notifications" {
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 22, height: 22)
                                    
                                    Text("3")
                                        .font(.custom("Poppins", size: 12))
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 20)
                            } else {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.grayProfile)
                                    .padding(.trailing, 20)
                            }
     
                        }
                        Divider()
                            .background(Color.grayExtra)
                            .padding(.horizontal, 20)
                            .opacity(0.5)
                        
                        .padding(.bottom, 22)
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    ProfileView()
}
