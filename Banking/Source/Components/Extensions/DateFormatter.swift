//
//  DateFormatter.swift
//  Banking
//
//  Created by Всеволод Оплачко on 15.08.2024.
//

import Foundation

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
