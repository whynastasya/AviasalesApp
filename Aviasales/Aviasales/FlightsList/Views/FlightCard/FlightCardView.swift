//
//  FlightCardView.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import SwiftUI

struct FlightCardView: View {
    let flight: Flight
    let arrival: RouteInfo
    let destination: RouteInfo
    
    init(flight: Flight, arrival: RouteInfo, destination: RouteInfo) {
        self.flight = flight
        self.arrival = arrival
        self.destination = destination
    }
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                PriceAirlineLogoView(price: flight.price, airlane: flight.airline)
                if flight.availableTicketsCount < 10 {
                    WarningTextView(ticketsCount: flight.availableTicketsCount)
                }
            }
            FlightPointView(routeInfo: arrival, dateTime: flight.arrivalDateTime)
            FlightPointView(routeInfo: destination, dateTime: flight.departureDateTime)
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            Group {
                if let badge = flight.badge {
                    BadgeView(badgeType: badge)
                        .offset(x: 8, y: -10)
                }
            },
            alignment: .topLeading
        )
        .padding(.top, flight.badge != nil ? 5 : 0)
    }
}

#Preview {
    FlightCardView(
        flight: Flight(id: "1", departureDateTime: "2023-09-03 20:25", arrivalDateTime: "2023-09-03 20:25", price: Price(currency: "RUB", value: 1232), airline: "S7", availableTicketsCount: 12, badge: .convenientTransfer),
        arrival: RouteInfo(iata: "MOW", name: "Москва"),
        destination: RouteInfo(iata: "LED", name: "Санкт-Петербург")
    )
}
