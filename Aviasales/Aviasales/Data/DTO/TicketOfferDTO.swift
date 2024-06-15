//
//  TicketOfferDTO.swift
//  Aviasales
//
//  Created by nastasya on 15.06.2024.
//

struct TicketOfferDTO: Identifiable, Decodable {
    let id: Int
    var title: String
    var timeRange: [Int]
    var price: PriceDTO
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case timeRange = "time_range"
        case price
    }
}

struct TicketsOffersResponse: Decodable {
    var ticketsOffers: [TicketOfferDTO]
}
