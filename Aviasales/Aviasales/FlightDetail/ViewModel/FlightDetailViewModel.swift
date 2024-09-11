//
//  FlightDetailViewModel.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import Foundation

final class FlightDetailViewModel: ViewModel {
    @Published var state: FlightDetailState
    
    init(state: FlightDetailState) {
        self.state = state
    }
    
    func trigger(_ action: FlightDetailAction) {
        switch action {
            case .buyTicket:
                buyTicket()
        }
    }
    
    private func buyTicket() {}
}
