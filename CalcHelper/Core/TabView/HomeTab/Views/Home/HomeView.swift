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
                    SettingView()
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

//MARK: COMPONENTS
struct TradingView: View {
    var body: some View {
        Text("Trading view")
            .font(.system(size: 18, weight: .medium))

        HStack {
            StreamsButton(title: "Streams", iconImage: "Streams")
            EditorsButton(title: "Editors’ picks", iconImage: "Editors'")
        }
    }
}

struct CalculatorsView: View {
    var body: some View {
        Text("Calculators")
            .font(.system(size: 18, weight: .medium))
            .padding(.top, 24)

        VStack {
            FibonacciButton(title: "Fibonacci Calculator", iconImage: "Fibonacci")
            GainAndLossButton(title: "Gain & Loss", iconImage: "GainLoss")
        }
    }
}

struct SettingView: View {
    var body: some View {
        SettingsButton(title: "Settings", iconImage: "Settings")
    }
}
