//
//  FibonacciButton.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 17.11.2023.
//

import SwiftUI

struct FibonacciButton: View {
    
    @State var title: String
    @State var iconImage: String

    var body: some View {
        Button {
            //TODO: Next View
        } label: {
            HStack() {
                Image(iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color.theme.customMint)

                Text(title)
                    .font(.system(size: 18, weight: .medium))
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 76)
        .foregroundStyle(.white)
        .background(Color.theme.backgroundComponents)
        .cornerRadius(16)
    }
}

#Preview {
    FibonacciButton(title: "Fibonacci Calculator", iconImage: "Fibonacci")
}
