//
//  FlightResponse.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

struct FlightResponse: Decodable, Equatable {
    let passengersCount: Int
    let origin: RouteInfo
    let destination: RouteInfo
    var results: [Flight]
    
    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin
        case destination
        case results
    }
    
    static func == (lhs: FlightResponse, rhs: FlightResponse) -> Bool {
        return lhs.passengersCount == rhs.passengersCount &&
        lhs.origin == rhs.origin &&
        lhs.destination == rhs.destination &&
        lhs.results == rhs.results
    }
}
