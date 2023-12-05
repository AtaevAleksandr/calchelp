//
//  DemoTraderView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 05.12.2023.
//

import SwiftUI

struct DemoTraderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Already ")
                +
                Text("452 558 ")
                    .foregroundColor(Color.theme.customMint)
                +
                Text("users have registered and are earning \nright now!")
            }
            .font(.system(size: 24, weight: .bold))
            .multilineTextAlignment(.center)
            .padding(.top)
            .padding(.horizontal)
            Spacer()

            ZStack {
                Ellipse()
                    .foregroundStyle(Color.theme.customMint)
                    .frame(width: 309, height: 455)
                    .opacity(0.3)
                    .blur(radius: 65)

                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.theme.backgroundComponents)
                    .frame(width: 300, height: 436)

                Image("Trader")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 236, height: 396)
            }
            Spacer()
            Spacer()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        BackgroundView()
        DemoTraderView()
    }
}
