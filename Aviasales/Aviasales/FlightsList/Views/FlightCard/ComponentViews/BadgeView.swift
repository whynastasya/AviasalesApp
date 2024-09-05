//
//  BadgeView.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import SwiftUI

struct BadgeView: View {
    let badgeType: BadgeType
    
    init(badgeType: BadgeType) {
        self.badgeType = badgeType
    }
    
    private var badgeBackgroundColor: Color {
        switch badgeType {
            case .cheapest:
                .greenBadge
            case .fastest:
                .blueBadge
            case .convenientTransfer:
                .purpleBadge
            case .optimal:
                .blueBadge
        }
    }
    
    var body: some View {
        Text(badgeType.title)
            .font(.badge)
            .foregroundStyle(.white)
            .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
            .background(badgeBackgroundColor)
            .clipShape(.rect(cornerRadius: 100))
    }
}

#Preview {
    BadgeView(badgeType: .convenientTransfer)
}
