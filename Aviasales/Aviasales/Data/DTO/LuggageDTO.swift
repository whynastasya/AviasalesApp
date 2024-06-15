//
//  LuggageDTO.swift
//  Aviasales
//
//  Created by nastasya on 16.06.2024.
//

struct LuggageDTO: Decodable {
    var hasLuggage: Bool
    var price: PriceDTO
    
    private enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage"
        case price
    }
}
