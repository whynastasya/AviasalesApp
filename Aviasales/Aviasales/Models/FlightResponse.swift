//
//  FlightResponse.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

struct FlightResponse: Codable {
    let passengersCount: Int
    let origin: RouteInfo
    let destination: RouteInfo
    let results: [Flight]
    
    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin
        case destination
        case results
    }
}
