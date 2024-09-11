//
//  Price.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

struct Price: Decodable, Equatable {
    let currency: String
    let value: Int
    
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = currencySymbol
        formatter.currencyGroupingSeparator = " "
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: value)) ?? "\(value) \(currencySymbol)"
    }
    
    private var currencySymbol: String {
        switch currency {
            case "RUB":
                return "₽"
            case "USD":
                return "$"
            case "EUR":
                return "€"
            default:
                return currency
        }
    }
}

