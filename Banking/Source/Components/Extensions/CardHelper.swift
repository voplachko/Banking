//
//  CardHelper.swift
//  Banking
//
//  Created by Всеволод Оплачко on 08.08.2024.
//

import Foundation

final class CardHelper {
    static func splitStringIntoChunks(_ input: String, chunkSize: Int? = nil) -> [String] {
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
