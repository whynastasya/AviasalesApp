//
//  FlightAssembly.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

@MainActor
final class FlightAssembly {
    func assembleFlightListView() -> some View {
        let viewModel = FlightsListViewModel(state: .init(status: .error(.networkError))).eraseToAnyViewModel()
        return FlightsListView(viewModel: viewModel)
    }
    
    func assembleFlightDetailView(flightInfo: FlightResponse, selectedFlight: Flight) -> some View {
        let viewModel = FlightDetailViewModel(state: .init(flightInfo: flightInfo, selectedFlight: selectedFlight)).eraseToAnyViewModel()
        return FlightDetailView(viewModel: viewModel)
    }
}
