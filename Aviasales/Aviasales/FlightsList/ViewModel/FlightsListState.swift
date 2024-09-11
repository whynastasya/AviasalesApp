//
//  FlightListState.swift
//  Aviasales
//
//  Created by nastasya on 11.09.2024.
//

import Foundation

struct FlightsListState {
    var status: Status
    
    enum Status: Equatable {
        static func == (lhs: FlightsListState.Status, rhs: FlightsListState.Status) -> Bool {
            switch (lhs, rhs) {
            case (.loading, .loading):
                return true
            case (.error(let lhsError), .error(let rhsError)):
                return lhsError == rhsError
            case (.loaded(let lhsResponse), .loaded(let rhsResponse)):
                return lhsResponse == rhsResponse
            default:
                return false
            }
        }
        
        case loading
        case error(FlightLoadError)
        case loaded(FlightResponse)
    }
}

