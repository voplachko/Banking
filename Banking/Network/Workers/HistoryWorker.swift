//
//  HistoryWorker.swift
//  Banking
//
//  Created by Всеволод Оплачко on 23.07.2024.
//

import Foundation

final class HistoryWorker {
    
    func getHistory(doneFrom: String,
                    doneTo: String,
                    direction: String,
                    service: String,
                    short: Bool,
                    language: String = "ru",
                    expand: String? = nil,
                    fields: String? = nil,
                    perPage: Int = 20,
                    page: Int = 1,
                    sort: String? = nil,
                    token: String,
                    failure: @escaping ((Any) -> Void),
                    success: @escaping Success<UserHistory>) {
        
        var parameters: [String: Any] = [
            "done_from": doneFrom,
            "done_to": doneTo,
            "direction": direction,
            "service": service,
            "short": short,
            "per-page": perPage,
            "page": page,
        ]
        
        if let expand = expand {
            parameters["expand"] = expand
        }
        if let fields = fields {
            parameters["fields"] = fields
        }
        if let sort = sort {
            parameters["sort"] = sort
        }
        
        let headers = ["language": language,
                       "Authorization": token]
        
        NetworkManager.shared.fetchData(from: "/history", parameters: parameters, headers: headers, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    let userHistory = try jsonDecoder.decode(UserHistory.self, from: data)
                    success(userHistory)
                } catch {
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
}
