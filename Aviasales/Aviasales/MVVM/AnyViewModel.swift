//
//  AnyViewModel.swift
//  Aviasales
//
//  Created by nastasya on 11.09.2024.
//

import Combine

@dynamicMemberLookup
final class AnyViewModel<Action, State>: ViewModel {
    
    var state: State {
        viewModel.state
    }
    
    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let viewModel: any ViewModel<Action, State>
    
    var objectWillChange: AnyPublisher<Void, Never> {
        wrappedObjectWillChange()
    }
    
    init(viewModel: some ViewModel<Action, State>) {
        self.viewModel = viewModel
        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
    }
    
    func trigger(_ action: Action) {
        viewModel.trigger(action)
    }
}
