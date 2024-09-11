//
//  ViewModel.swift
//  Aviasales
//
//  Created by nastasya on 08.09.2024.
//

import Foundation
import Combine

@MainActor
protocol ViewModel<Action, State>: ObservableObject where ObjectWillChangePublisher.Output == Void, ObjectWillChangePublisher.Failure == Never {
    associatedtype Action
    associatedtype State
    
    var state: State { get }
    
    func trigger(_ action: Action)
}

extension ViewModel {
    subscript<V>(dynamicMember keyPath: KeyPath<State, V>) -> V {
        get {
            state[keyPath: keyPath]
        }
    }
}

extension ViewModel {
    func eraseToAnyViewModel() -> AnyViewModel<Action, State> {
        AnyViewModel(viewModel: self)
    }
}

import SwiftUI

struct MyView: View {
    
    @StateObject var viewModel: AnyViewModel<FlightsListAction, FlightsListState>
    
    var body: some View {
        Button("Hello") {
            viewModel.trigger(.loadFlights)
        }
    }
}

#Preview {
    MyView(
        viewModel: MockViewModel(state: FlightsListState(status: .loading)).eraseToAnyViewModel()
    )
}
