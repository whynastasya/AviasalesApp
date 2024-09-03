//
//  AviasalesApp.swift
//  Aviasales
//
//  Created by nastasya on 03.09.2024.
//

import SwiftUI

@main
struct AviasalesApp: App {
    private let flightAssembly = FlightAssembly()
    private var flightsListScreen: some View {
        flightAssembly.assembleFlightListView()
    }

    var body: some Scene {
        WindowGroup {
            flightsListScreen
        }
    }
}
