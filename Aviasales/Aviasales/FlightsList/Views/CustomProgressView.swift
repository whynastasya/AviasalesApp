//
//  CustomProgressView.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import SwiftUI

struct CustomProgressView: View {
    @State private var isAnimating = false
    @State private var trimEnd: CGFloat = 0.2

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.grayProgressView, lineWidth: 5)
                .frame(width: 40, height: 40)

            Circle()
                .trim(from: 0.0, to: trimEnd)
                .stroke(.blueProgressView, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 40, height: 40)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: isAnimating)
        }
        .onAppear {
            isAnimating = true
            animateTrim()
        }
    }
    
    private func animateTrim() {
        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            trimEnd = 0.9
        }
    }
}

#Preview {
    CustomProgressView()
}

