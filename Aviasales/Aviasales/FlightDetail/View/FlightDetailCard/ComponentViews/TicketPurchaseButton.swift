//
//  TicketPurchaseButton.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import SwiftUI

struct TicketPurchaseButton: View {
    let price: Price
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Купить билет за " + price.formatted)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .font(.purchaseButton)
                .padding(.vertical, 14)
                .background(Color.orangePurchaseButton)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    TicketPurchaseButton(price: Price(currency: "USD", value: 123), action: {})
}
