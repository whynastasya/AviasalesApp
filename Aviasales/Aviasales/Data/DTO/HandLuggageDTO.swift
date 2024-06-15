//
//  HandLuggageDTO.swift
//  Aviasales
//
//  Created by nastasya on 16.06.2024.
//

struct HandLuggageDTO: Decodable {
    var hasHandLuggage: Bool
    var size: String
    
    private enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage"
        case size
    }
}
