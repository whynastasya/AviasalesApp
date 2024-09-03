//
//  FlightsListViewModel.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

protocol FlightsListViewModel: ObservableObject {
    var flightsInfo: FlightResponse { get }
    
    func fetchFlights()
    func sortFlights()
}
