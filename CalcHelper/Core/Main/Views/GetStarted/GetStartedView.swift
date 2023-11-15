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

            Image("GetReady")
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        GetStartedView()
    }
}
