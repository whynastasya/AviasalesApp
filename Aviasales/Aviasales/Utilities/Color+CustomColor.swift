//
//  Color+CustomColor.swift
//  Aviasales
//
//  Created by nastasya on 04.09.2024.
//

import SwiftUI

extension Color {
    static func customColor(red: Double, green: Double, blue: Double, opacity: Double = 1.0) -> Color {
        return Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: opacity)
    }
    
    static let greenBadge: Color = customColor(red: 53, green: 199, blue: 104)
    static let bluePrice: Color = customColor(red: 12, green: 115, blue: 254)
    static let redWarning: Color = customColor(red: 221, green: 66, blue: 79)
    static let blackText: Color = customColor(red: 12, green: 19, blue: 29)
    static let grayText: Color = customColor(red: 90, green: 100, blue: 114)
    static let grayScrollView: Color = customColor(red: 239, green: 241, blue: 244)
    static let purpleBadge: Color = customColor(red: 185, green: 131, blue: 241)
    static let blueBadge: Color = customColor(red: 51, green: 184, blue: 255)
    static let orangePurchaseButton: Color = customColor(red: 255, green: 111, blue: 50)
    static let blueProgressView: Color = customColor(red: 11, green: 115, blue: 254)
    static let grayProgressView: Color = .gray.opacity(0.2)
    static let yellowWarning: Color = customColor(red: 254, green: 169, blue: 22)
}
