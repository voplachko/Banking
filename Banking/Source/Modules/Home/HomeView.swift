//
//  HomeView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("kIsUserAuthorized") var isUserAuthorized: Bool = false
    @StateObject var model: HomeViewModel = .init()
    
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
                
                CardWidget(pan: "535254252524525",
                           cvv: "533",
                           cardHolder: "Bogdan Shmatov",
                           expDate: "11/2030",
                           cardSystemName: "Visa")
                
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
                    
                    
                  
                    
                    ForEach(model.operations, id: \.id) { item in
                      
                        
                        HistoryRow(item)
                        
                    }
                    
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
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
//        .ignoresSafeArea(.all)
        .onAppear {
            model.getHistory()
        }
    }
    
    @ViewBuilder
    func HistoryRow(_ item: UserHistory) -> some View {
        
        
        Text("history Item \(item.title)")
            .foregroundStyle(.white)
        
    }
}

#Preview {
    HomeView()
}





//Button("Log Out") {
//
//                UserDefaultsWrapper.userAccount = nil
//                UserDefaultsWrapper.isSeenOnboarding = false
//                isUserAuthorized = false
//
//            }
