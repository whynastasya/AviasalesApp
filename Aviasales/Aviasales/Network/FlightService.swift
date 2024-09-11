//
//  NetworkService.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import Foundation

final class FlightService: Sendable {
    private let decoder = JSONDecoder()
    private let baseURL = "https://nu.vsepoka.ru/api/search?origin=MOW&destination=LED"

    func fetchFlights() async throws -> FlightResponse {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode(FlightResponse.self, from: data)
    }
}
