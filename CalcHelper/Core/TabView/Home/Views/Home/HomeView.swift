//
//  HomeView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 13.11.2023.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundTabView()

                VStack(alignment: .leading) {
                    TradingView()
                    CalculatorsView()
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}

struct TradingView: View {
    var body: some View {
        Text("Trading view")
            .font(.system(size: 18, weight: .medium))

        HStack {
            TargetButton(title: "Streams", iconImage: "Streams")
            TargetButton(title: "Editors’ picks", iconImage: "Editors'")
        }
    }
}

struct CalculatorsView: View {
    var body: some View {
        Text("Calculators")
            .font(.system(size: 18, weight: .medium))
            .padding(.top, 24)

        VStack {
            CalculatorButton(title: "Fibonacci Calculator", iconImage: "Fibonacci")
            CalculatorButton(title: "Gain & Loss", iconImage: "GainLoss")
            SettingsButton(title: "Settings", iconImage: "Settings")
        }
    }
}
