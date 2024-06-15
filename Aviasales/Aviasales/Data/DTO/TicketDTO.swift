//
//  TicketDTO.swift
//  Aviasales
//
//  Created by nastasya on 16.06.2024.
//

struct TicketDTO: Identifiable, Decodable {
    let id: Int
    var badge: String
    var price: PriceDTO
    var providerName: String
    var company: String
    var departure: FlightDetailDTO
    var arrival: FlightDetailDTO
    var hasTransfer: Bool
    var hasVisaTransfer: Bool
    var luggage: LuggageDTO
    var handLuggage: HandLuggageDTO
    var isReturnable: Bool
    var isExchangable: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case badge
        case price
        case providerName = "provider_name"
        case company
        case departure
        case arrival
        case hasTransfer = "has_transfer"
        case hasVisaTransfer = "has_visa_transfer"
        case luggage
        case handLuggage = "hand_luggage"
        case isReturnable = "is_returnable"
        case isExchangable = "is_exchangable"
    }
}

struct TicketsResponse: Decodable {
    var tickets: [TicketDTO]
}
