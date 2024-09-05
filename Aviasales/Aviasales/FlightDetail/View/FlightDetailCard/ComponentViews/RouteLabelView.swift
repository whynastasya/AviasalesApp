//
//  RouteLabelView.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import SwiftUI

struct RouteLabelView: View {
    let arrival: String
    let destination: String
    
    var body: some View {
        Text(arrival + " — " + destination)
            .font(.routeLabel)
            .foregroundStyle(Color.blackText)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 4)
    }
}

#Preview {
    RouteLabelView(arrival: "Москва", destination: "Норильск")
}
