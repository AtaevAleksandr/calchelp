//
//  SignalsView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 15.11.2023.
//

import SwiftUI

struct SignalsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundTabView()

                Text("Signals")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            .navigationTitle("Signals")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SignalsView()
}
