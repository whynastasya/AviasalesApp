//
//  WarningTextView.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import SwiftUI

struct WarningTextView: View {
    let ticketsCount: Int
    
    var body: some View {
        Text("Осталось \(ticketsCount) \(pluralizeTickets(ticketsCount)) по этой цене")
            .font(.warningText)
            .foregroundStyle(Color.redWarning)
    }
    
    private func pluralizeTickets(_ count: Int) -> String {
        let lastDigit = count % 10
        let lastTwoDigits = count % 100
        
        if lastTwoDigits >= 11 && lastTwoDigits <= 14 {
            return "билетов"
        } else if lastDigit == 1 {
            return "билет"
        } else if lastDigit >= 2 && lastDigit <= 4 {
            return "билета"
        } else {
            return "билетов"
        }
    }
}

#Preview {
    WarningTextView(ticketsCount: 1)
}
