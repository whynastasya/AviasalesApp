//
//  PriceForFlightDetailView.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import SwiftUI

struct PriceForFlightDetailView: View {
    let price: Price
    let passengersCount: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text(price.formatted)
                .font(.priceFlightDetail)
                .foregroundStyle(Color.blackText)
            
            Text("Лучшая цена за \(passengersCount) чел")
                .font(.warningText)
                .foregroundStyle(Color.blackText)
        }
    }
}

#Preview {
    PriceForFlightDetailView(price: Price(currency: "RUB", value: 1234), passengersCount: 1)
}
