//
//  Flight.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

struct Flight: Identifiable, Decodable {
    let id: String
    let departureDateTime: Date
    let arrivalDateTime: Date
    let price: Price
    let airline: String
    let availableTicketsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case departureDateTime = "departure_date_time"
        case arrivalDateTime = "arrival_date_time"
        case price
        case airline
        case availableTicketsCount = "available_tickets_count"
    }
}
