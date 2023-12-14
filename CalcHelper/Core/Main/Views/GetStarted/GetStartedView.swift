//
//  GetStartedView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct GetStartedView: View {
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
                    Image("Heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)

                    Text("The application is ready, \nwe are glad that you \nchose us!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

