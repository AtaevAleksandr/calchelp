//
//  HomeView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 13.11.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()

            Text("Home View")
                .font(.title)
        }
    }
}

#Preview {
    HomeView()
}
