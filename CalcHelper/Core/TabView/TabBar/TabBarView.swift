//
//  TabBarView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 15.11.2023.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home",
                          image: "Home")
                }

            SignalsView()
                .tabItem {
                    Label("Signals",
                          image: "Signals")
                }
        }
        .accentColor(Color.theme.customMint)
        .overlay(alignment: .bottom) {
            Divider()
                .foregroundStyle(.gray)
                .offset(y: -49)
        }
    }
}

#Preview {
    TabBarView()
        .preferredColorScheme(.dark)
}
