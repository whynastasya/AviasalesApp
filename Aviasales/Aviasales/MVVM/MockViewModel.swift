//
//  MockViewModel.swift
//  Aviasales
//
//  Created by nastasya on 11.09.2024.
//

import Foundation

final class MockViewModel<Action, State>: ViewModel {
    
    @Published var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func trigger(_ action: Action) {
        print(String(describing: action))
    }
}
