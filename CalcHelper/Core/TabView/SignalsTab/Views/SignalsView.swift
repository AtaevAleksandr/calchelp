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

                VStack(alignment: .leading) {
                    ChooseARisk()
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Signals")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SignalsView()
        .preferredColorScheme(.dark)
}

struct ChooseARisk: View {

    @State private var lowButtonIsActive: Bool = true
    @State private var normalButtonIsActive: Bool = false
    @State private var highButtonIsActive: Bool = false

    var body: some View {
        Text("Choose a risk")
            .font(.system(size: 16, weight: .medium))

        HStack {
            lowRiskButton
            normalRiskButton
            highRiskButton
        }
    }

    //MARK: FUNCTIONS
    private func lowButtonPressed() {
        lowButtonIsActive = true
        normalButtonIsActive = false
        highButtonIsActive = false
    }

    private func normalButtonPressed() {
        lowButtonIsActive = false
        normalButtonIsActive = true
        highButtonIsActive = false
    }

    private func highButtonPressed() {
        lowButtonIsActive = false
        normalButtonIsActive = false
        highButtonIsActive = true
    }
}

//MARK: COMPONENTS
extension ChooseARisk {
    var lowRiskButton: some View {
        Button {
            withAnimation(.spring) {
                lowButtonPressed()
            }
        } label: {
            Text("Low")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(lowButtonIsActive ? Color.white : Color.gray)
                .frame(height: 36)
                .frame(maxWidth: .infinity)
                .background(lowButtonIsActive ? Color.theme.customMint : Color.theme.inactiveButton)
                .cornerRadius(8)
        }
    }

    var normalRiskButton: some View {
        Button {
            withAnimation(.spring) {
                normalButtonPressed()
            }
        } label: {
            Text("Normal")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(normalButtonIsActive ? Color.white : Color.gray)
                .frame(height: 36)
                .frame(maxWidth: .infinity)
                .background(normalButtonIsActive ? Color.theme.customMint : Color.theme.inactiveButton)
                .cornerRadius(8)
        }
    }

    var highRiskButton: some View {
        Button {
            withAnimation(.spring) {
                highButtonPressed()
            }
        } label: {
            Text("High")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(highButtonIsActive ? Color.white : Color.gray)
                .frame(height: 36)
                .frame(maxWidth: .infinity)
                .background(highButtonIsActive ? Color.theme.customMint : Color.theme.inactiveButton)
                .cornerRadius(8)
        }
    }
}
