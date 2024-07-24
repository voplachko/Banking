//
//  Transactions.swift
//  Banking
//
//  Created by Всеволод Оплачко on 24.07.2024.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var model: HomeViewModel = .init()
    
    var body: some View {
        VStack {
            HStack {
                Button(action:  {
                    dismiss()
                }) {
                    Image("Back_Icon")
                        .resizable()
                        .frame(width: 42, height: 42)
                }
                Spacer()
                
                Text("Transaction History")
                    .font(.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image("TimeButton")
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            HStack {
                Text("Today")
                    .font(.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button("See all") {
                    
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 30)
            
            ScrollView {
                ForEach(model.operations, id: \.id) { item in
                    
                    HistoryRow(item)
                    
                }
            }
            
            Spacer()
        }
        .background(Color.bankingPrimary)
        .onAppear {
            model.getHistory()
        }
    }
    
    @ViewBuilder
    func HistoryRow(_ item: UserHistory) -> some View {
        HStack {
            if let pictureURL = URL(string: item.service.pictureURL ?? "") {
                AsyncImage(url: pictureURL) { image in
                    image
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 42, height: 42)
                }
                .padding(.trailing, 17)
            } else {
                Image(systemName: "photo")
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                    .padding(.trailing, 17)
            }

            VStack(alignment: .leading) {
                Text(item.service.name)
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

            Text("\(item.amount, specifier: "%.2f")")
                .font(.custom("Poppins", size: 16))
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
    
}



#Preview {
    TransactionHistoryView()
}
