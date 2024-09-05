//
//  RouteInfoNavigationBar.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import SwiftUI

struct RouteInfoNavigationBar: View {
    let flightResponse: FlightResponse
    
    init(flightResponse: FlightResponse) {
        self.flightResponse = flightResponse
    }
    
    var body: some View {
        VStack(spacing: 2) {
            Text(routeText)
                .font(.flightCity)
                .foregroundStyle(Color.blackText)
            
            Text(dateAndPassengersText)
                .font(.dateNavigationBar)
                .foregroundStyle(Color.grayText)
        }
    }
    
    private var routeText: String {
        guard let firstFlight = flightResponse.results.first else { return "" }
        return "\(flightResponse.origin.name) — \(flightResponse.destination.name)"
    }

    private var dateAndPassengersText: String { 
        guard let firstFlight = flightResponse.results.first else { return "" }
        return "\(DateFormatterHelper.formattedDateForNavigationBar(from: flightResponse.results[0].arrivalDateTime)), \(flightResponse.passengersCount) чел"
    }
}

#Preview {
    RouteInfoNavigationBar(flightResponse: FlightsListViewModelImpl().flightsInfo)
}