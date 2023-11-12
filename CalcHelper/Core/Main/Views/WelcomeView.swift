//
//  WelcomeView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Text("Welcome!")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 60)

                Text("Our application gives you the opportunity to use popular calculators on your phone")
                    .frame(width: 278)
                    .font(.system(size: 18, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .padding(.top, 94)

                Text("Trade without distracting from the process, and leave the calculations you need to the application!")
                    .frame(width: 278)
                    .font(.system(size: 18, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .padding(.top, 134)
                Spacer()

                ContinueButtonView(buttonName: "Continue")
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    WelcomeView()
}
