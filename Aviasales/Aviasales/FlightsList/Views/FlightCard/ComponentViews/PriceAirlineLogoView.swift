//
//  PriceAirlineLogoView.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import SwiftUI

struct PriceAirlineLogoView: View {
    let price: Price
    let airlane: String
    
    init(price: Price, airlane: String) {
        self.price = price
        self.airlane = airlane
    }
    
    var body: some View {
        HStack {
            Text(price.formatted)
                .font(.price)
                .foregroundStyle(Color.bluePrice)
                .padding([.top, .bottom], 1.5)
            
            Spacer()
            
            Image(airlane)
                .resizable()
                .frame(width: 26, height: 26)
        }
    }
}

#Preview {
    PriceAirlineLogoView(price: Price(currency: "RUB", value: 1111234), airlane: "S7")
}
