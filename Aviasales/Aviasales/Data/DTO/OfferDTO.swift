//
//  OfferDTO.swift
//  Aviasales
//
//  Created by nastasya on 15.06.2024.
//

struct OfferDTO: Identifiable, Decodable {
    let id: Int
    var title: String
    var town: String
    var price: PriceDTO
}

struct OffersResponse: Decodable {
    var offers: [OfferDTO]
}
