//
//  MyCardsView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI

struct MyCardsView: View {
    
    @State private var isShowAddCard: Bool = false
    @State private var sliderValue: Double = 500000.0
    
    var transactions: [UserHistory]
    
    var body: some View {
        VStack {
            HStack {
                Image("Back_Icon")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .opacity(0)
                
                Spacer()
                
                Text("My Cards")
                    .font(.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image("Add-Icon2")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .onTapGesture {
                        isShowAddCard = true
                    }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            Image("Card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            
            ForEach(transactions.prefix(3), id: \.id) { item in
                HistoryRow(item)
            }
            
            Text("Monthly spending limit")
                .font(.custom("Poppins", size: 18))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            
            VStack {
                Text("Amount: ₸\(sliderValue, specifier: "%.2f")")
                    .font(.custom("Poppins", size: 13))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                Slider(value: $sliderValue, in: 0...1000000)
                    .padding(.horizontal, 20)
                
                
                HStack {
                    Text("₸0")
                        .font(.custom("Poppins", size: 12))
                        .foregroundColor(Color.grayExtra)
                    
                    Spacer()
                    
                    Text("₸1М")
                        .font(.custom("Poppins", size: 12))
                        .foregroundColor(Color.grayExtra)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            .background(Color.blockColor)
            .cornerRadius(18)
            .padding(20)
            
            Spacer()
        }
        .background(Color.bankingPrimary)
        .fullScreenCover(isPresented: $isShowAddCard) {
            AddCardView()
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
    MyCardsView(transactions: [])
}
