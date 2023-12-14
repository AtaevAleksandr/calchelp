//
//  SignalsView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 15.11.2023.
//

import SwiftUI

struct SignalsView: View {

    @EnvironmentObject private var viewModel: SignalViewModel

    @State private var showLowSignals: Bool = true
    @State private var showNormalSignals: Bool = false
    @State private var showHighSignals: Bool = false

    @State private var lowButtonIsActive: Bool = true
    @State private var normalButtonIsActive: Bool = false
    @State private var highButtonIsActive: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundTabView()

                VStack {
                    headerView

                    timerView

                    if showLowSignals {
                        allLowSignals
                            .onAppear {
                                viewModel.loadLowSignalData()
                                viewModel.generateRandomLowSignalData()
                            }
                    } else if showNormalSignals {
                        allNormalSignals
                            .onAppear {
                                viewModel.loadNormalSignalData()
                                viewModel.generateRandomNormalSignalData()
                            }
                    } else if showHighSignals {
                        allHighSignals
                            .onAppear {
                                viewModel.loadHighSignalData()
                                viewModel.generateRandomHighSignalData()
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Signals")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    //MARK: FUNCTIONS
    private func lowButtonPressed() {
        showLowSignals = true
        showNormalSignals = false
        showHighSignals  = false

        lowButtonIsActive = true
        normalButtonIsActive = false
        highButtonIsActive = false
    }

    private func normalButtonPressed() {
        showLowSignals = false
        showNormalSignals = true
        showHighSignals  = false

        lowButtonIsActive = false
        normalButtonIsActive = true
        highButtonIsActive = false
    }

    private func highButtonPressed() {
        showLowSignals = false
        showNormalSignals = false
        showHighSignals  = true

        lowButtonIsActive = false
        normalButtonIsActive = false
        highButtonIsActive = true
    }
}


//MARK: COMPONENTS OF SIGNALSVIEW
extension SignalsView {
    var headerView: some View {
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

    var timerView: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Update signal")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)

            TimerView()

        }
        .padding(.top)
    }

    var allLowSignals: some View {
        ScrollView(showsIndicators: false) {
            if let signalData: [SignalModel] = viewModel.allLowSignals[viewModel.formattedDate()] {
                ForEach(signalData) { signal in
                    SignalRowView(signal: signal)
                }
            }
        }
    }

    var allNormalSignals: some View {
        ScrollView(showsIndicators: false) {
            if let signalData: [SignalModel] = viewModel.allNormalSignals[viewModel.formattedDate()] {
                ForEach(signalData) { signal in
                    SignalRowView(signal: signal)
                }
            }
        }
    }

    var allHighSignals: some View {
        ScrollView(showsIndicators: false) {
            if let signalData: [SignalModel] = viewModel.allHighSignals[viewModel.formattedDate()] {
                ForEach(signalData) { signal in
                    SignalRowView(signal: signal)
                }
            }
        }
    }
}

//MARK: COMPONENTS OF CHOOSE A RISK
extension SignalsView {
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
