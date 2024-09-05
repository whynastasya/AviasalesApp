//
//  DateFormatterHelper.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import Foundation

struct DateFormatterHelper {
    static func formattedTime(from dateString: String) -> String {
        guard let date = dateFromString(dateString) else { return dateString }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    static func formattedDateForFlightCard(from dateString: String) -> String {
        guard let date = dateFromString(dateString) else { return dateString }
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, EEE"
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.shortMonthSymbols = formatter.shortMonthSymbols.map { $0.replacingOccurrences(of: ".", with: "") }

        let dateString = formatter.string(from: date).lowercased()

        let monthMapping: [String: String] = [
            "янв": "янв",
            "фев": "фев",
            "мар": "мар",
            "апр": "апр",
            "мая": "май",
            "июн": "июн",
            "июл": "июл",
            "авг": "авг",
            "сент": "сен",
            "окт": "окт",
            "нояб": "ноя",
            "дек": "дек"
        ]

        var customDateString = dateString
        for (longMonth, shortMonth) in monthMapping {
            customDateString = customDateString.replacingOccurrences(of: longMonth, with: shortMonth)
        }

        return customDateString
    }
    
    static func formattedDateForNavigationBar(from dateString: String) -> String {
        guard let date = dateFromString(dateString) else { return dateString }
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date).lowercased()
    }
    
    static func dateFromString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.date(from: dateString)
    }
}
