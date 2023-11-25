//
//  SignalsView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 15.11.2023.
//

import SwiftUI

struct SignalsView: View {

    @State private var currentDate: Date = Date()
    @State private var timeRemaining = ""
    @State private var selectedRisk: String = "Low"

    @StateObject private var viewModel: SignalViewModel = SignalViewModel()

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()

    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour) : \(minute) : \(second)"
    }

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundTabView()

                VStack {
                    ChooseARisk(selectedRisk: $selectedRisk, viewModel: viewModel)

                    timerView

                    SignalRowView()
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

//MARK: COMPONENTS OF SIGNALSVIEW
extension SignalsView {
    var timerView: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Update signal")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)

            TimerView()

        }
        .padding(.top)
    }
}

struct ChooseARisk: View {

    @State private var lowButtonIsActive: Bool = true
    @State private var normalButtonIsActive: Bool = false
    @State private var highButtonIsActive: Bool = false

    @Binding var selectedRisk: String
    @ObservedObject var viewModel: SignalViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose a risk")
                .font(.system(size: 16, weight: .medium))

            HStack {
                lowRiskButton
                normalRiskButton
                highRiskButton
            }
        }
        .padding(.bottom)
    }

    //MARK: FUNCTIONS
    private func lowButtonPressed() {
        selectedRisk = "Low"
        
        lowButtonIsActive = true
        normalButtonIsActive = false
        highButtonIsActive = false
    }

    private func normalButtonPressed() {
        selectedRisk = "Normal"

        lowButtonIsActive = false
        normalButtonIsActive = true
        highButtonIsActive = false
    }

    private func highButtonPressed() {
        selectedRisk = "High"

        lowButtonIsActive = false
        normalButtonIsActive = false
        highButtonIsActive = true
    }
}

//MARK: COMPONENTS OF CHOOSE A RISK
extension ChooseARisk {
    var lowRiskButton: some View {
        Button {
            lowButtonPressed()
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
            normalButtonPressed()
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
            highButtonPressed()
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
