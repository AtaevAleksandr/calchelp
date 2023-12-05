//
//  FirstDepositView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 05.12.2023.
//

import SwiftUI

struct FirstDepositView: View {
    var body: some View {
        ZStack {
            Ellipse()
                .foregroundStyle(Color.theme.customMint)
                .frame(width: 375, height: 347)
                .opacity(0.4)
                .blur(radius: 65)

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.theme.backgroundComponents)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .frame(height: 249)

                VStack(spacing: 16) {
                    Image("Deposit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)

                    Text("Your first deposit \nwas successful. \nCongrats!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        FirstDepositView()
    }
}
