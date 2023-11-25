//
//  GainLossCalculator.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 19.11.2023.
//

import SwiftUI

struct GainLossCalculator: View {

    @Environment(\.dismiss) var dissmiss
    @Binding var showGainLoss: Bool

    @State private var balanceWas: String = ""
    @State private var amountOfDiff: String = ""
    @State private var percentageOfDiff: String = ""
    @State private var currentBalance: String = ""
    @State private var isWon: Bool = true
    @State private var showResult: Bool = false
    @State private var percentageOfResult: Double = 0.0

    var body: some View {
        NavigationView {
            ZStack() {
                BackgroundTabView()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        descriptionText

                        VStack(spacing: 15) {
                            HStack {
                                balanceTextField
                                gainLossButton
                            }

                            HStack {
                                amountTextField
                                percentageTextField
                            }
                        }

                        currentBalanceTextField

                        if showResult {
                            resultView
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Gain & Loss")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { dissmissButton }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
    }

    //MARK: FUNCTIONS
    func calculate() {
        if let initial = Double(balanceWas), var current = Double(currentBalance) {
            let updatePercentage = abs((current - initial) / initial) * 100
            let updateAmount = abs(current - initial)

            if isWon {
                current = initial + updateAmount
            } else {
                current = initial - updateAmount
            }
            percentageOfResult = (updateAmount * 100) / current
            percentageOfDiff = String(format: "%.1f", updatePercentage)
            amountOfDiff = String(format: "%.2f", updateAmount)
            currentBalance = String(format: "%.2f", current)
            showResult = true

        } else if let initial = Double(balanceWas), let percentage = Double(percentageOfDiff) {
            var updatedBalance = initial + ((percentage / 100) * initial)
            let updateAmount = (initial * percentage) / 100

            if isWon {
                updatedBalance = initial + ((percentage / 100) * initial)
            } else {
                updatedBalance = initial - ((percentage / 100) * initial)
            }
            percentageOfResult = (updateAmount * 100) / updatedBalance
            percentageOfDiff = String(format: "%.1f", percentage)
            amountOfDiff = String(format: "%.2f", updateAmount)
            currentBalance = String(format: "%.2f", updatedBalance)
            showResult = true

        } else if let initial = Double(balanceWas), let diff = Double(amountOfDiff) {
            var updatedBalance = initial + diff
            let updatePercentage = (diff / initial) * 100

            if isWon {
                updatedBalance = initial + diff
            } else {
                updatedBalance = initial - diff
            }
            percentageOfResult = (diff * 100) / updatedBalance
            percentageOfDiff = String(format: "%.2f", updatePercentage)
            amountOfDiff = String(format: "%.2f", diff)
            currentBalance = String(format: "%.2f", updatedBalance)
            showResult = true

        } else {
            showResult = false
        }
    }
}

#Preview {
    GainLossCalculator(showGainLoss: .constant(false))
        .preferredColorScheme(.dark)
}

//MARK: COMPONENTS
extension GainLossCalculator {
    private var descriptionText: some View {
        Text("""
             This online gain and loss percentage calculator quickly tells you what percentage of the account balance you have won or lost. It also estimates a percentage of current balance required to get to the breakeven point again. Alternatively, you can enter the percentages and see the size of your gain or loss in currency.

             The calculator will do its work as you fill out the fields. You can switch between loss and gain by clicking the button. You can even find out your starting balance by filling your current balance and the recent balance change.
             """)
        .padding()
        .font(.system(size: 16, weight: .regular))
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(Color.theme.backgroundComponents)
        .cornerRadius(16)
    }

    private var balanceTextField: some View {
        VStack(alignment: .leading) {
            Text("Your balance was")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)

            TextField("", text: Binding(
                get: { self.balanceWas },
                set: { newValue in
                    self.balanceWas = newValue.replacingOccurrences(of: ",", with: ".")
                    self.calculate()
                }
            ))
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.theme.backgroundComponents)
            .overlay(
                HStack {
                    Spacer()
                    Text("*")
                        .padding(.trailing, 10)
                }
            )
            .cornerRadius(10)
            .keyboardType(.decimalPad)
        }
    }

    private var gainLossButton: some View {
        VStack(alignment: .leading) {
            Text("and you")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)

            Button {
                isWon.toggle()
                calculate()
            } label: {
                Text(isWon ? "Won" : "Lost")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 120, height: 45)
                    .background(isWon ? Color.theme.customGreen : Color.theme.customRed)
                    .cornerRadius(10)
            }
        }
    }

    private var amountTextField: some View {
        VStack(alignment: .leading) {
            Text("The amount of profit/loss")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)

            TextField("", text: Binding(
                get: { self.amountOfDiff },
                set: { newValue in
                    self.amountOfDiff = newValue.replacingOccurrences(of: ",", with: ".")
                    self.calculate()
                }
            ))
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.theme.backgroundComponents)
            .cornerRadius(10)
            .keyboardType(.decimalPad)
        }
    }

    private var percentageTextField: some View {
        VStack(alignment: .leading) {
            Text("which is (%)")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)


            TextField("", text: Binding(
                get: { self.percentageOfDiff },
                set: { newValue in
                    self.percentageOfDiff = newValue.replacingOccurrences(of: ",", with: ".")
                    self.calculate()
                }
            ))
            .font(.headline)
            .padding(.horizontal)
            .foregroundStyle(.white)
            .frame(width: 120, height: 45)
            .background(Color.theme.backgroundComponents)
            .cornerRadius(10)
            .keyboardType(.decimalPad)
        }
    }

    private var currentBalanceTextField: some View {
        VStack(alignment: .leading) {
            Text("Your current balance")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)

            TextField("", text: Binding(
                get: { self.currentBalance },
                set: { newValue in
                    self.currentBalance = newValue.replacingOccurrences(of: ",", with: ".")
                    self.calculate()
                }
            ))
                .padding(.horizontal)
                .frame(height: 45)
                .background(Color.theme.backgroundComponents)
                .overlay(
                    HStack {
                        Spacer()
                        Text("*")
                            .padding(.trailing, 10)
                    }
                )
                .cornerRadius(10)
                .keyboardType(.decimalPad)
        }
    }

    private var resultView: some View {
        VStack(alignment: .leading) {
            Text("Results")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)

            HStack {
                if isWon {
                    Text("You can now afford to lose ")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                    +
                    Text("\(String(format: "%.1f", (percentageOfResult * 10).rounded() / 10.0))%")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color.theme.customRed)
                    +
                    Text(", before getting back to your starting balance.")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                } else {
                    Text("You will have to win ")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                    +
                    Text("\(String(format: "%.1f", (percentageOfResult * 10).rounded() / 10.0))%")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color.theme.customGreen)
                    +
                    Text(", to get back to your starting balance.")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                }
            }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.theme.backgroundComponents)
                .cornerRadius(16)
        }
        .padding(.top)
    }

    private var dissmissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                showGainLoss.toggle()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}
