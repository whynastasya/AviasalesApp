//
//  FlightAssembly.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

final class FlightAssembly {
    func assembleFlightListView() -> some View {
        let viewModel = FlightsListViewModelImpl()
        return FlightsListView(viewModel: viewModel)
    }
    
    func assembleFlightDetailView(flightInfo: FlightResponse, selectedFlight: Flight) -> some View {
        let viewModel = FlightDetailViewModelImpl(flightInfo: flightInfo, selectedFlight: selectedFlight)
        return FlightDetailView(viewModel: viewModel)
    }
}
