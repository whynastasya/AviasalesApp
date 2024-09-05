//
//  FlightDetailCardView.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import SwiftUI

struct FlightDetailCardView: View {
    let flight: Flight
    let arrival: RouteInfo
    let destination: RouteInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            AirlaneView(airlane: flight.airline)
                .padding(.bottom, 4)
            
            VStack(spacing: 12) {
                FlightPointView(routeInfo: arrival, dateTime: flight.arrivalDateTime)
                FlightPointView(routeInfo: destination, dateTime: flight.departureDateTime)
            }
            .padding([.horizontal, .bottom], 16)
        }
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    FlightDetailCardView(flight: Flight(id: "1", departureDateTime: "2023-09-03 20:25", arrivalDateTime: "2023-09-03 20:25", price: Price(currency: "RUB", value: 1232), airline: "S7", availableTicketsCount: 12, badge: .convenientTransfer),arrival: RouteInfo(iata: "MOW", name: "Москва"), destination: RouteInfo(iata: "LED", name: "Санкт-Петербург"))
}
