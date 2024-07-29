//
//  UserAccount.swift
//  Banking
//
//  Created by Всеволод Оплачко on 18.07.2024.
//

import Foundation

struct UserAccount: Codable {
    let parentLogin: JSONNull?
    let subjectType, country, id: Int
    let login: String
    let status: Int
    let roles: [String]
    let assignments: JSONNull?
    let token, email: String
    let createdAt: String
    let identified: Int
    let residentKz: Bool
    let card: JSONNull?

    enum CodingKeys: String, CodingKey {
        case parentLogin = "parent_login"
        case subjectType = "subject_type"
        case country, id, login, status, roles, assignments, token, email
        case createdAt = "created_at"
        case identified
        case residentKz = "resident_kz"
        case card
    }
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
