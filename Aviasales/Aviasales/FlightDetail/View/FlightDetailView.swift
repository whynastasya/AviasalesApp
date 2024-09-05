//
//  FlightDetailView.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

struct FlightDetailView<ViewModel: FlightDetailViewModel>: View {
    @StateObject private var viewModel: ViewModel
    @State private var showAlert = false
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            VStack {
                PriceForFlightDetailView(price: viewModel.selectedFlight.price, passengersCount: viewModel.flightInfo.passengersCount)
                    .padding(.bottom, 32)
                
                RouteLabelView(arrival: viewModel.flightInfo.origin.name, destination: viewModel.flightInfo.destination.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                FlightDetailCardView(flight: viewModel.selectedFlight, arrival: viewModel.flightInfo.origin, destination: viewModel.flightInfo.destination)
            }
            .padding(16)
            
            Spacer()
            
            TicketPurchaseButton(price: viewModel.selectedFlight.price) {
                showAlert = true
            }
            .padding(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.grayScrollView.ignoresSafeArea())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Билет куплен за \(viewModel.selectedFlight.price.formatted)"),
                dismissButton: .default(Text("Отлично"), action: {
                    viewModel.buyTicket(on: viewModel.selectedFlight)
                })
            )
        }
    }
}


#Preview {
    FlightDetailView(viewModel: FlightDetailViewModelImpl(flightInfo: FlightsListViewModelImpl().flightsInfo, selectedFlight: FlightsListViewModelImpl().flightsInfo.results[3]))
}
