//
//  FlightsListViewModel.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

@MainActor
protocol FlightsListViewModel: ObservableObject {
    var flightsInfo: FlightResponse { get set }
    var isLoading: Bool { get set }
    var error: FlightLoadError? { get set }
    
    func loadFlights() async
}
