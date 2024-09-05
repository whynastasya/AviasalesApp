//
//  FlightPointView.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import SwiftUI

struct FlightPointView: View {
    let routeInfo: RouteInfo
    let dateTime: String
    
    init(routeInfo: RouteInfo, dateTime: String) {
        self.routeInfo = routeInfo
        self.dateTime = dateTime
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(routeInfo.name)
                    .font(.flightCity)
                    .foregroundStyle(Color.blackText)
                
                Text(routeInfo.iata)
                    .font(.warningText)
                    .foregroundStyle(Color.grayText)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text(DateFormatterHelper.formattedTime(from: dateTime))
                    .font(.flightCity)
                    .foregroundStyle(Color.blackText)
                
                Text(DateFormatterHelper.formattedDateForFlightCard(from: dateTime))
                    .font(.warningText)
                    .foregroundStyle(Color.grayText)
            }
        }
    }
}

#Preview {
    FlightPointView(routeInfo: RouteInfo(iata: "MOW", name: "Москва"), dateTime: "2023-09-03 20:25")
}
