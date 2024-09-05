//
//  FlightsListView.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

struct FlightsListView<ViewModel: FlightsListViewModel>: View {
    @StateObject private var viewModel: ViewModel
    private let flightAssembly = FlightAssembly()

    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    CustomProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.error {
                    ErrorTimeoutView {
                        Task {
                            await viewModel.loadFlights()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(viewModel.flightsInfo.results) { flight in
                                NavigationLink(destination: flightAssembly.assembleFlightDetailView(flightInfo: viewModel.flightsInfo, selectedFlight: flight)) {
                                    FlightCardView(
                                        flight: flight,
                                        arrival: viewModel.flightsInfo.origin,
                                        destination: viewModel.flightsInfo.destination
                                    )
                                    .padding(.horizontal, 16)
                                }
                            }
                            .padding(.top, 16)
                        }
                    }
                }
            }
            .background(Color.backgroundColor)
            .navigationTitle("Все билеты")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    RouteInfoNavigationBar(flightResponse: viewModel.flightsInfo)
                }
            }
            .toolbarBackground(Color.backgroundColor, for: .navigationBar)
            .onAppear {
                Task {
                    await viewModel.loadFlights()
                }
            }
        }
    }
}

#Preview {
    FlightsListView(viewModel: FlightsListViewModelImpl())
}
