//
//  DemoCalculatorsView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct DemoCalculatorsView: View {
    var body: some View {
        VStack {
            Text("There are two of the most \npopular calculators at your \ndisposal")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
            Spacer()
            Spacer()

            ZStack {
                Ellipse()
                    .foregroundStyle(Color.theme.customMint)
                    .frame(width: 360, height: 150)
                    .opacity(0.3)
                    .blur(radius: 65)
                    .offset(y: 16)
                
                VStack(alignment: .leading) {
                    CalculatorsView()
                        .disabled(true)
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

