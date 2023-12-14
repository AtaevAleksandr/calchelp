//
//  DemoSignalsView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 05.12.2023.
//

import SwiftUI

struct DemoSignalsView: View {
    var body: some View {
        VStack {
            Text("Don't miss your chance to make money!")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)

            Text("Turn on push notifications \nfor more efficient use of push notifications")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
            Spacer()

            ZStack {
                Ellipse()
                    .foregroundStyle(Color.theme.customMint)
                    .frame(width: 360, height: 150)
                    .opacity(0.3)
                    .blur(radius: 65)
                    .offset(y: 20)

                VStack(alignment: .leading) {
                    SignalRowView(signal: .init(iconImage: "USD:JPY", name: "USD/JPY", status: .strongSell))
                    SignalRowView(signal: .init(iconImage: "EUR:GBP", name: "EUR/GBP", status: .strongSell))
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

