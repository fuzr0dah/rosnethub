//
//  Int+Extensions.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import Foundation

extension Int {
    func timestampToString() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "HH:mm dd.mm.yyyy"
        return dateFormatter.string(from: date)
    }
}
