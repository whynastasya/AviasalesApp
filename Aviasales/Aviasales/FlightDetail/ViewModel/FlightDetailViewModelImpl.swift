//
//  FlightDetailViewModelImpl.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

final class FlightDetailViewModelImpl: FlightDetailViewModel {
    @Published private(set) var flightInfo: FlightResponse
    @Published private(set) var selectedFlight: Flight
    
    init(flightInfo: FlightResponse, selectedFlight: Flight) {
        self.flightInfo = flightInfo
        self.selectedFlight = selectedFlight
    }
    
    func buyTicket(on flight: Flight) {
        
    }
}
