//
//  DemoTargetsView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct DemoTargetsView: View {
    var body: some View {
        VStack {
            Text("Direct access to a popular \nplatform")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top)
            Spacer()

            Text("Live streams and articles selected by the editorial board")
                .frame(width: 278)
                .font(.system(size: 18, weight: .heavy))
                .multilineTextAlignment(.center)
            Spacer()

            ZStack {
                Ellipse()
                    .foregroundStyle(Color.theme.customMint)
                    .frame(width: 360, height: 100)
                    .opacity(0.3)
                    .blur(radius: 65)
                    .offset(y: 20)

                VStack(alignment: .leading) {
                    TradingView()
                        .disabled(true)
                }
                .padding(.horizontal)
            }

            Spacer()
            Spacer()
            Spacer()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        BackgroundView()
        DemoTargetsView()
    }
}
