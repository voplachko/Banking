//
//  CardWidget.swift
//  Banking
//
//  Created by Всеволод Оплачко on 23.07.2024.
//

import SwiftUI

struct CardWidget: View {
    
    @State var pan: String = "4562112245957852"
    @State var cvv: String = ""
    @State var cardHolder: String = ""
    @State var expDate: String = ""
    @State var cardSystem: String = ""
    
    var formatedPan: [String] {
        return splitStringIntoChunks(pan)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
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
                    Text("Expiry Date")
                        .foregroundStyle(.gray)
                    Text(expDate)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("CVV")
                        .foregroundStyle(.gray)
                    Text(cvv)
                }
                Spacer()
                Image(cardSystem)
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
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        )
    }
    
    private func splitStringIntoChunks(_ input: String, chunkSize: Int? = nil) -> [String]  {
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

#Preview {
    CardWidget()
}
