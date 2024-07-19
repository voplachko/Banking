//
//  UserAccount.swift
//  Banking
//
//  Created by Всеволод Оплачко on 18.07.2024.
//

import Foundation

// MARK: - UserAccount
struct UserAccount: Codable {
    let id, login, status: Int
    let roles: [String]
    let assignments: JSONNull?
    let token, email, createdAt: String
    let card: [Card]

    enum CodingKeys: String, CodingKey {
        case id, login, status, roles, assignments, token, email
        case createdAt = "created_at"
        case card
    }
}

// MARK: - Card
struct Card: Codable {
    let uid, name, expire, mask: String
    let status: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}


