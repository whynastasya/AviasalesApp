//
//  FlightDetailDTO.swift
//  Aviasales
//
//  Created by nastasya on 16.06.2024.
//

import Foundation

struct FlightDetailDTO: Decodable {
    var town: String
    var date: String
    var airport: String
    
    var formattedDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.date(from: date)
    }
}
