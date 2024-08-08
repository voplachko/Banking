//
//  CardWidget.swift
//  Banking
//
//  Created by Bogdan Shmatov on 23.07.2024.
//

import SwiftUI

struct CardWidget: View {
    
    @Binding var pan: String
    @Binding var cvv: String
    @Binding var cardHolder: String
    @Binding var expDate: String

    @State var cardSystem: String = "Mastercard"
    @State var chip: String = "SIM"
    @State var waves: String = "ContactlessPayment"
    
    var formatedPan: [String] {
        return splitStringIntoChunks(pan)
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
    
    private func splitStringIntoChunks(_ input: String, chunkSize: Int? = nil) -> [String] {
        let chunkSize = chunkSize ?? 4
        
        var chunks: [String] = []
        var startIndex = input.startIndex
        
        while startIndex < input.endIndex {
            let endIndex = input.index(startIndex, offsetBy: chunkSize, limitedBy: input.endIndex) ?? input.endIndex
            let chunk = String(input[startIndex..<endIndex])
            chunks.append(chunk)
            startIndex = endIndex
        }
        
        return chunks
    }
}
