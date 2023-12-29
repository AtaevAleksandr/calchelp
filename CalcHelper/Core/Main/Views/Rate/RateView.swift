//
//  RateView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct RateView: View {
    var body: some View {
        VStack {
            Text("Help us to impove the app")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
            Spacer()

            ZStack {
                Ellipse()
                    .foregroundStyle(Color.theme.customMint)
                    .frame(width: 281, height: 343)
                    .opacity(0.4)
                    .blur(radius: 65)
                    .offset(y: 16)

                VStack(alignment: .center) {
                    Text("Other users about us")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.bottom, 24)
                        .padding(.horizontal)

                    Image("MockFeedback")
                        .resizable()
                        .scaledToFit()
                }
                .padding(.horizontal)
            }

            Spacer()
            Spacer()
        }
        .foregroundStyle(.white)
    }
}
