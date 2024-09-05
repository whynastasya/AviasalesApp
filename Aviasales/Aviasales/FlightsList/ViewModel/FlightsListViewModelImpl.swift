//
//  FlightsListViewModelImpl.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

@MainActor
final class FlightsListViewModelImpl: FlightsListViewModel {
    @Published var flightsInfo: FlightResponse = FlightResponse(
        passengersCount: 0,
        origin: RouteInfo(iata: "", name: ""),
        destination: RouteInfo(iata: "", name: ""),
        results: []
    )
    @Published var isLoading: Bool = false
    @Published var error: FlightLoadError? = nil
    
    private let flightService = FlightService()
    
    func loadFlights() async {
        isLoading = true
        error = nil
        
        do {
            try await withThrowingTaskGroup(of: Void.self) { group in
                group.addTask {
                    let response = try await self.flightService.fetchFlights()
                    await MainActor.run {
                        self.flightsInfo = response
                        self.isLoading = false
                        self.sortFlights()
                    }
                }
                
                group.addTask {
                    try await Task.sleep(nanoseconds: 5000000000)
                    await MainActor.run {
                        if self.isLoading {
                            self.error = .timeout
                            self.isLoading = false
                        }
                    }
                }
                
                try await group.next()
                
                if self.isLoading {
                    await MainActor.run {
                        self.error = .timeout
                        self.isLoading = false
                    }
                }
            }
        } catch {
            await MainActor.run {
                self.error = .networkError
                self.isLoading = false
            }
        }
    }
    
    private func sortFlights() {
        var sortedFlights = flightsInfo.results.sorted(by: { $0.price.value < $1.price.value })
        
        if let cheapestIndex = sortedFlights.indices.min(by: { sortedFlights[$0].price.value < sortedFlights[$1].price.value }) {
            sortedFlights[cheapestIndex].badge = .cheapest
        }
        
        if let randomFlightIndex = sortedFlights.indices.randomElement() {
            sortedFlights[randomFlightIndex].badge = .optimal
        }
        
        flightsInfo = FlightResponse(
            passengersCount: flightsInfo.passengersCount,
            origin: flightsInfo.origin,
            destination: flightsInfo.destination,
            results: sortedFlights
        )
    }
}
