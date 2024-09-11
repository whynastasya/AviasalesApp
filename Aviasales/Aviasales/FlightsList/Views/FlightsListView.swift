//
//  FlightsListView.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

struct FlightsListView: View {
    @ObservedObject var viewModel: AnyViewModel<FlightsListAction, FlightsListState>
    private let flightAssembly = FlightAssembly()

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state.status {
                    case .loading:
                        CustomProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .error(_):
                        ErrorTimeoutView {
                            viewModel.trigger(.loadFlights)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .loaded(let flightResponse):
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(flightResponse.results) { flight in
                                NavigationLink(destination: flightAssembly.assembleFlightDetailView(flightInfo: flightResponse, selectedFlight: flight)) {
                                    FlightCardView(
                                        flight: flight,
                                        arrival: flightResponse.origin,
                                        destination: flightResponse.destination
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
                if case .loaded(let flightResponse) = viewModel.state.status {
                    ToolbarItem(placement: .principal) {
                        RouteInfoNavigationBar(flightResponse: flightResponse)
                    }
                }
            }
            .toolbarBackground(Color.backgroundColor, for: .navigationBar)
            .onAppear {
                viewModel.trigger(.loadFlights)
            }
        }
    }
}

#Preview {
    FlightsListView(viewModel: MockViewModel(state: .init(status: .loading)).eraseToAnyViewModel())
}
