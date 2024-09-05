//
//  BadgeType.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

enum BadgeType {
    case cheapest
    case fastest
    case convenientTransfer
    case optimal
    
    var title: String {
        switch self {
            case .cheapest:
                return "Самый дешевый"
            case .fastest:
                return "Самый быстрый"
            case .convenientTransfer:
                return "Удобная пересадка"
            case .optimal:
                return "Оптимальный"
        }
    }
}
