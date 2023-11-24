//
//  GainAndLossButton.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 16.11.2023.
//

import SwiftUI

struct GainAndLossButton: View {

    @State var title: String
    @State var iconImage: String
    @State var showGainLoss: Bool = false

    var body: some View {
        Button {
            showGainLoss.toggle()
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
        .fullScreenCover(isPresented: $showGainLoss) {
            GainLossCalculator(showGainLoss: $showGainLoss)
        }
    }
}

#Preview {
    GainAndLossButton(title: "Gain & Loss", iconImage: "GainLoss")
}
