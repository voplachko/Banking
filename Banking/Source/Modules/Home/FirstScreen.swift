//
//  FirstScreen.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI

struct FirstScreen: View {
    
    @AppStorage("kIsUserAuthorized") var isUserAuthorized: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("Boss")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.leading, 20)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Welcome back,")
                            .font(.custom("Poppins", size: 12))
                            .fontWeight(.regular)
                            .foregroundColor(Color.grayProfile)
                        
                        Text("Bogdan Shmatov")
                            .font(.custom("Poppins", size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 16)
                    
                    Spacer()
                    
                    Image("Search")
                        .frame(width: 42, height: 42)
                        
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Spacer().frame(height: 32)
                
                ZStack {
                    Image("Card")
                        .resizable()
                        .padding(.leading, 20)
                        .aspectRatio(contentMode: .fill)
                    
                    GeometryReader { geometry in
                        Text("4562   1122   4595   7852")
                            .font(.custom("Inter", size: 24))
                            .foregroundColor(.white)
                            .position(x: geometry.size.width * 0.45, y: geometry.size.height * 0.2)
                    }
                    
                    GeometryReader { geometry in
                        Text("NIKITA NIKITIN")
                            .font(.custom("Inter", size: 13))
                            .foregroundColor(.white)
                            .position(x: geometry.size.width * 0.22, y: geometry.size.height * 0.28)
                    }
                    
                    GeometryReader { geometry in
                        Text("06/2026")
                            .font(.custom("Inter", size: 13))
                            .foregroundColor(.white)
                            .position(x: geometry.size.width * 0.165, y: geometry.size.height * 0.38)
                    }
                    
                    GeometryReader { geometry in
                        Text("696")
                            .font(.custom("Inter", size: 13))
                            .foregroundColor(.white)
                            .position(x: geometry.size.width * 0.355, y: geometry.size.height * 0.38)
                    }
                    
                    GeometryReader { geometry in
                        Image("Mastercard")
                            .position(x: geometry.size.width * 0.8, y: geometry.size.height * 0.35)
                    }
                    
                    VStack {
                        HStack {
                            VStack {
                                Image("Sent")
                                
                                Text("Sent")
                                    .font(.custom("Poppins", size: 14))
                                    .foregroundColor(Color.grayExtra)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Image("Receive")
                                
                                Text("Receive")
                                    .font(.custom("Poppins", size: 14))
                                    .foregroundColor(Color.grayExtra)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Image("Loan")
                                
                                Text("Loan")
                                    .font(.custom("Poppins", size: 14))
                                    .foregroundColor(Color.grayExtra)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Image("Topup")
                                
                                Text("Topup")
                                    .font(.custom("Poppins", size: 14))
                                    .foregroundColor(Color.grayExtra)
                            }
                        }
                        .padding(.top, 200)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        
                        
                        HStack {
                            Text("Transaction")
                                .font(.custom("Poppins", size: 18))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button("Sell all") {
                                
                            }
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.medium)
                            
                        }
                        .padding()
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    
                    }
                    
                    
                    
                }
                
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
//        .ignoresSafeArea(.all)
    }
}

#Preview {
    FirstScreen()
}





//Button("Log Out") {
//
//                UserDefaultsWrapper.userAccount = nil
//                UserDefaultsWrapper.isSeenOnboarding = false
//                isUserAuthorized = false
//
//            }
