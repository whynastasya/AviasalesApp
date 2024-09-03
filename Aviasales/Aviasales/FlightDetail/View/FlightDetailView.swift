//
//  FlightDetailView.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

struct FlightDetailView<ViewModel: FlightDetailViewModel>: View {
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FlightDetailView(viewModel: FlightDetailViewModelImpl(flightInfo: FlightsListViewModelImpl().flightsInfo, selectedFlight: FlightsListViewModelImpl().flightsInfo.results[3]))
}
