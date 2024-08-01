//
//  HomeView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Query var cardItems: [CardItem]
    
    @AppStorage("kIsUserAuthorized") var isUserAuthorized: Bool = false
    @StateObject var model: HomeViewModel = .init()
    @State private var isShowTransactionHistoryView: Bool = false
    @State private var isShowAllCards: Bool = false
    @State private var isShowSendMoney: Bool = false
    @State private var isShowRequestMoney: Bool = false

    
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
                
//                CardWidget(pan: ,
//                           cvv: "533",
//                           cardHolder: "Bogdan Shmatov",
//                           expDate: "11/2030",
//                           cardSystem: "Mastercard",
//                           chip: "SIM",
//                           waves: "ContactlessPayment")
//                .onTapGesture {
//                    withAnimation {
//                        isShowAllCards = true
//                    }
//                }
                
                Button("Show All Cards") {
                    isShowAllCards = true
                }
                
                VStack {
                    HStack {
                        VStack {
                            Image("Sent")
                            
                            Text("Send")
                                .font(.custom("Poppins", size: 14))
                                .foregroundColor(Color.grayExtra)
                        }
                        .onTapGesture {
                            withAnimation {
                                isShowSendMoney = true
                            }
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image("Receive")
                            
                            Text("Receive")
                                .font(.custom("Poppins", size: 14))
                                .foregroundColor(Color.grayExtra)
                        }
                        .onTapGesture {
                            withAnimation {
                                isShowRequestMoney = true
                            }
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
                    .padding(.top, 30)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    
                    
                    HStack {
                        Text("Transaction")
                            .font(.custom("Poppins", size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button("See all") {
                            isShowTransactionHistoryView = true
                        }
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.medium)
                        
                    }
                    .padding()
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    ForEach(model.operations, id: \.id) { item in
                        
                        HistoryRow(item)
                        
                    }
                    
                    
                }
                
                
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.bankingPrimary)
        //        .ignoresSafeArea(.all)
        .onAppear {
            model.getHistory()
        }
        .fullScreenCover(isPresented: $isShowTransactionHistoryView) {
            TransactionHistoryView()
        }
        .fullScreenCover(isPresented: $isShowAllCards) {
            AllCardsView()
        }
        .fullScreenCover(isPresented: $isShowSendMoney) {
            SendMoneyView()
        }
        .fullScreenCover(isPresented: $isShowRequestMoney) {
            RequestMoneyView()
        }
    }
    
    @ViewBuilder
    func HistoryRow(_ item: UserHistory) -> some View {
        HStack {
            if let pictureURL = URL(string: item.service.pictureURL ?? "") {
                AsyncImage(url: pictureURL) { image in
                    image
                        .resizable()
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .frame(width: 42, height: 42)
                }
                .padding(.trailing, 17)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                    .padding(.trailing, 17)
            }
            
            VStack(alignment: .leading) {
                Text(item.service.title)
                    .font(.custom("Poppins", size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Text(item.service.desc ?? "")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Text("- $\(item.amount, specifier: "%.2f")")
                .font(.custom("Poppins", size: 16))
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
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
