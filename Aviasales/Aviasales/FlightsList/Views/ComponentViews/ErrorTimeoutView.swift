//
//  ErrorTimeoutView.swift
//  Aviasales
//
//  Created by nastasya on 05.09.2024.
//

import SwiftUI

struct ErrorTimeoutView: View {
        var retryAction: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 26, height: 23)
                .foregroundStyle(Color.yellowWarning)
            
            Text("Что-то пошло не так")
                .font(.routeLabel)
                .foregroundStyle(.title)
            
            Text("Возможно, пропал интернет, или у нас что-то сломалось. Проверьте подключение или попробуйте позже")
                .font(.warningText)
                .foregroundStyle(.title)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Обновить")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .font(.purchaseButton)
                    .padding(.vertical, 10)
                    .background(.blueProgressView)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.top, 10)
        }
        .padding(16)
    }
}

#Preview {
    ErrorTimeoutView(retryAction: {})
}
