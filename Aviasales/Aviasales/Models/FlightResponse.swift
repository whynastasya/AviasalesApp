//
//  FlightResponse.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

struct FlightResponse: Decodable {
    let passengersCount: Int
    let origin: RouteInfo
    let destination: RouteInfo
    let results: [Flight]
}
