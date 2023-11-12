//
//  UpdatesView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct UpdatesView: View {
    var body: some View {
        ZStack {
            BackgroundView()

            Image("DemoPhone")
                .resizable()
                .scaledToFill()
                .frame(height: 561)
                .offset(y: 40)

            VStack {
                Text("Don't miss new updates")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                Spacer()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    UpdatesView()
}
