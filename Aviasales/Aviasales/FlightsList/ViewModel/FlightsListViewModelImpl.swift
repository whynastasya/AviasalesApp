//
//  FlightsListViewModelImpl.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

final class FlightsListViewModelImpl: FlightsListViewModel {
    @Published private(set) var flightsInfo: FlightResponse = FlightResponse(
        passengersCount: 1,
        origin: RouteInfo(iata: "MOW", name: "Москва"),
        destination: RouteInfo(iata: "LED", name: "Санкт-Петербург"),
        results:
            [Flight(id: "1", departureDateTime: Date(), arrivalDateTime: Date(),
                    price: Price(currency: "RUB", value: 12341), airline: "S7", availableTicketsCount: 11),
             Flight(id: "2", departureDateTime: Date(), arrivalDateTime: Date(),
                     price: Price(currency: "RUB", value: 12341), airline: "S7", availableTicketsCount: 23),
             Flight(id: "3", departureDateTime: Date(), arrivalDateTime: Date(),
                     price: Price(currency: "RUB", value: 1341), airline: "S7", availableTicketsCount: 2),
             Flight(id: "4", departureDateTime: Date(), arrivalDateTime: Date(),
                     price: Price(currency: "RUB", value: 123), airline: "S7", availableTicketsCount: 3),
             Flight(id: "5", departureDateTime: Date(), arrivalDateTime: Date(),
                     price: Price(currency: "RUB", value: 12), airline: "S7", availableTicketsCount: 11),
             Flight(id: "6", departureDateTime: Date(), arrivalDateTime: Date(),
                     price: Price(currency: "RUB", value: 12342), airline: "S7", availableTicketsCount: 11)])
    
    init() {
        fetchFlights()
    }
    
    func fetchFlights() {
        
    }
    
    func sortFlights() {
        
    }
}
