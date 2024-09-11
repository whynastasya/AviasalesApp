//
//  FlightDetailView.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

struct FlightDetailView: View {
    @ObservedObject var viewModel: AnyViewModel<FlightDetailAction, FlightDetailState>
    @State private var showAlert = false
    
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
                viewModel.trigger(.buyTicket)
            }
            .padding(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.backgroundColor.ignoresSafeArea())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Билет куплен за \(viewModel.selectedFlight.price.formatted)"),
                dismissButton: .default(Text("Отлично"), action: {})
            )
        }
    }
}
