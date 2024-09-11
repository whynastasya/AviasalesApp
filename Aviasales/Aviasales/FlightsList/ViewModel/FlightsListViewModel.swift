//
//  FlightsListViewModel.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

@MainActor
final class FlightsListViewModel: ViewModel {
    @Published var state: FlightsListState
    private let flightService: FlightService
        
    init(state: FlightsListState, flightService: FlightService = FlightService()) {
        self.state = state
        self.flightService = flightService
    }
    
    func trigger(_ action: FlightsListAction) {
        switch action {
            case .loadFlights:
                Task {
                    await loadFlights()
                }
        }
    }
    
    private func loadFlights() async {
        state.status = .loading

        await withTaskGroup(of: Void.self) { group in
            group.addTask { await self.fetchFlightsFromService() }
            group.addTask { await self.handleTimeout() }
        }
    }
    
    private func fetchFlightsFromService() async {
        do {
            let response = try await flightService.fetchFlights()
            let sortedFlights = sortFlights(response)
            state.status = .loaded(sortedFlights)
        } catch {}
    }
    
    private func handleTimeout() async {
        do {
            try await Task.sleep(nanoseconds: 5000000000)
            if state.status == .loading {
                state.status = .error(.timeout)
            }
        } catch {}
    }
    
    private func sortFlights(_ flightResponse: FlightResponse) -> FlightResponse {
        var sortedFlights = flightResponse.results.sorted(by: { $0.price.value < $1.price.value })
        
        if let cheapestIndex = sortedFlights.indices.min(by: { sortedFlights[$0].price.value < sortedFlights[$1].price.value }) {
            sortedFlights[cheapestIndex].badge = .cheapest
        }
        
        if let randomFlightIndex = sortedFlights.indices.filter({ $0 != 0 }).randomElement() {
            sortedFlights[randomFlightIndex].badge = .optimal
        }
        
        if let randomFlightIndex = sortedFlights.indices.filter({ $0 != 0 }).randomElement() {
            sortedFlights[randomFlightIndex].badge = .convenientTransfer
        }
        
        var result = flightResponse
        result.results = sortedFlights
        
        return result
    }
}
