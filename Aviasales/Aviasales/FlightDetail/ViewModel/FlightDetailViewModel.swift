//
//  FlightDetailViewModel.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

protocol FlightDetailViewModel: ObservableObject {
    var flightInfo: FlightResponse { get }
    var selectedFlight: Flight { get }
    
    func buyTicket(on flight: Flight)
}
