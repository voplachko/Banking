//
//  ThirdScreen.swift
//  Banking
//
//  Created by Всеволод Оплачко on 21.07.2024.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            HStack {
                Image("Back_Icon")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .opacity(0)
                
                Spacer()
                
                Text("Statistics")
                    .font(.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image("Bell")
                    .resizable()
                    .frame(width: 42, height: 42)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            Spacer()
        }
        .background(Color.bankingPrimary)
    }
}

#Preview {
    StatsView()
}
