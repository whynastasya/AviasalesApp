//
//  AirlaneView.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import SwiftUI

struct AirlaneView: View {
    let airlane: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(airlane)
                .resizable()
                .frame(width: 32, height: 32)
            
            Text(airlane)
                .font(.flightCity)
                .foregroundStyle(.title)
        }
        .padding(12)
    }
}

#Preview {
    AirlaneView(airlane: "Аэрофлот")
}
