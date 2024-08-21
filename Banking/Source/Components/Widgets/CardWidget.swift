//
//  CardWidget.swift
//  Banking
//
//  Created by Bogdan Shmatov on 23.07.2024.
//

import SwiftUI

struct AddCardWidget: View {
    
    @Binding var pan: String
    @Binding var cvv: String
    @Binding var cardHolder: String
    @Binding var expDate: String

    @State var cardSystem: String = "Mastercard"
    @State var chip: String = "SIM"
    @State var waves: String = "ContactlessPayment"
    
    var formatedPan: [String] {
        return CardHelper.splitStringIntoChunks(pan)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                Image(chip)
                
                Spacer()
                
                Image(waves)
            }
            .padding(.top, 10)
            
            Spacer()
            HStack(alignment: .center) {

                ForEach(formatedPan, id: \.self) {
                    Text($0)
                    Spacer()
                }
            }
            .font(.custom("Inter", size: 24))
            .foregroundColor(.white)
            
            Text(cardHolder)
                .font(.custom("Inter", size: 13))
                .foregroundColor(.white)
            
            
            HStack(spacing: 22) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Date")
                        .foregroundStyle(.gray)
                    Text(expDate)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("CVV")
                        .foregroundStyle(.gray)
                    Text(cvv)

                }
                
                Spacer()
                // Как определить какая платежная система?
                // виса, мастеркард, мир или американ экспресс?
                
                // Visa - начинаются с цифры - "4"
                // MasterCard с цифры "5"
                // American Express с цифры "3"
                
                let panFirstSymbol = pan.prefix(1)
                
                switch panFirstSymbol {
                case "2": Image("Mir")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44)
                case "5": Image("Mastercard")
                case "4": Image("visa")
                default: Image("amex")
                }
                
                
            }
            .padding(.bottom, 22)
            .font(.custom("Inter", size: 13))
            .foregroundColor(.white)
        }
        
        .frame(height: 200)
        .padding(.horizontal, 42)
        .background(
            Image("Card")
                .resizable()
                .padding(.horizontal, 20)
                .aspectRatio(contentMode: .fill)
        )
    }
}

struct CardWidget: View {
    
    @State var pan: String
    @State var cvv: String
    @State var cardHolder: String
    @State var expDate: String

    @State var cardSystem: String = "Mastercard"
    @State var chip: String = "SIM"
    @State var waves: String = "ContactlessPayment"
    
    var formatedPan: [String] {
        return CardHelper.splitStringIntoChunks(pan)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                Image(chip)
                
                Spacer()
                
                Image(waves)
            }
            .padding(.top, 10)
            
            Spacer()
            HStack(alignment: .center) {

                ForEach(formatedPan, id: \.self) {
                    Text($0)
                    Spacer()
                }
            }
            .font(.custom("Inter", size: 24))
            .foregroundColor(.white)
            
            Text(cardHolder)
                .font(.custom("Inter", size: 13))
                .foregroundColor(.white)
            
            
            HStack(spacing: 22) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Date")
                        .foregroundStyle(.gray)
                    Text(expDate)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("CVV")
                        .foregroundStyle(.gray)
                    Text(cvv)

                }
                
                Spacer()
                // Как определить какая платежная система?
                // виса, мастеркард, мир или американ экспресс?
                
                // Visa - начинаются с цифры - "4"
                // MasterCard с цифры "5"
                // American Express с цифры "3"
                
                let panFirstSymbol = pan.prefix(1)
                
                switch panFirstSymbol {
                case "2": Image("Mir")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44)
                case "5": Image("Mastercard")
                case "4": Image("visa")
                default: Image("amex")
                }
                
                
            }
            .padding(.bottom, 22)
            .font(.custom("Inter", size: 13))
            .foregroundColor(.white)
        }
        
        .frame(height: 200)
        .padding(.horizontal, 42)
        .background(
            Image("Card")
                .resizable()
                .padding(.horizontal, 20)
                .aspectRatio(contentMode: .fill)
        )
    }
    
}
