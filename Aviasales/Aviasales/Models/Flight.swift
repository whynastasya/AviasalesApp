//
//  Flight.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

struct Flight: Identifiable, Decodable, Equatable {
    let id: String
    let departureDateTime: String
    let arrivalDateTime: String
    let price: Price
    let airline: String
    let availableTicketsCount: Int
    var badge: BadgeType?
    
    enum CodingKeys: String, CodingKey {
        case id
        case departureDateTime = "departure_date_time"
        case arrivalDateTime = "arrival_date_time"
        case price
        case airline
        case availableTicketsCount = "available_tickets_count"
    }
    
    static func == (lhs: Flight, rhs: Flight) -> Bool {
        return lhs.id == rhs.id &&
        lhs.departureDateTime == rhs.departureDateTime &&
        lhs.arrivalDateTime == rhs.arrivalDateTime &&
        lhs.price == rhs.price &&
        lhs.airline == rhs.airline &&
        lhs.availableTicketsCount == rhs.availableTicketsCount &&
        lhs.badge == rhs.badge
    }
}
