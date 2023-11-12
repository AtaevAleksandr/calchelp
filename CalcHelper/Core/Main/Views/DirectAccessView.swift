//
//  DirectAccessView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct DirectAccessView: View {
    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Text("Direct access to a popular\nplatform")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                Spacer()
                
                Text("Live streams and articles selected by the editorial board")
                    .frame(width: 278)
                    .font(.system(size: 18, weight: .heavy))
                    .multilineTextAlignment(.center)
                Spacer()

                ZStack {
                    Ellipse()
                        .foregroundStyle(Color.theme.continueButtonColor)
                        .frame(width: 360, height: 100)
                        .opacity(0.3)
                        .blur(radius: 65)
                        .offset(y: 20)
                    VStack(alignment: .leading) {
                        Text("Trading view")
                            .font(.system(size: 18, weight: .medium))
                        Image("DemoTargets")
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    DirectAccessView()
}
