import SwiftUI

struct ContentView: View {
    @State private var initialBalance = ""
    @State private var amountDifference = ""
    @State private var percentageOfAmount = ""
    @State private var currentBalance = ""
    @State private var isWon: Bool = true
    @State private var showResult: Bool = false
    @State private var percentageOfResult: Double = 0.0

    var body: some View {
        VStack {
            Button {
                isWon.toggle()
                calculate()
            } label: {
                Text(isWon ? "Won" : "Lost")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 120, height: 45)
                    .animation(nil, value: UUID())
                    .background(isWon ? Color.theme.customGreen : Color.theme.customRed)
                    .cornerRadius(10)
            }

            TextField("Initial Balance", text: Binding(
                get: { self.initialBalance },
                set: { newValue in
                    self.initialBalance = newValue
                    self.calculate()
                }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .keyboardType(.decimalPad)
            .overlay {
                Text("*")
                    .padding(.trailing)
//                    .foregroundStyle(.white)
            }

            TextField("Amount Difference", text: Binding(
                get: { self.amountDifference },
                set: { newValue in
                    self.amountDifference = newValue
                    self.calculate()
                }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .keyboardType(.decimalPad)

            TextField("Percentage of Amount", text: Binding(
                get: { self.percentageOfAmount },
                set: { newValue in
                    self.percentageOfAmount = newValue
                    self.calculate()
                }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .keyboardType(.decimalPad)

            TextField("Current Balance", text: Binding(
                get: { self.currentBalance },
                set: { newValue in
                    self.currentBalance = newValue
                    self.calculate()
                }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .keyboardType(.decimalPad)

            Spacer()

            if showResult {
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

            Spacer()
        }
        .padding()
    }

    func calculate() {
        if let initial = Double(initialBalance), var current = Double(currentBalance) {
            let updatePercentage = abs((current - initial) / initial) * 100
            let updateAmount = abs(current - initial)

            if isWon {
                current = initial + updateAmount
            } else {
                current = initial - updateAmount
            }
            percentageOfResult = (updateAmount * 100) / current
            percentageOfAmount = String(format: "%.1f", updatePercentage)
            amountDifference = String(format: "%.2f", updateAmount)
            currentBalance = String(format: "%.2f", current)
            showResult = true

        } else if let initial = Double(initialBalance), let percentage = Double(percentageOfAmount) {
            var updatedBalance = initial + ((percentage / 100) * initial)
            let updateAmount = (initial * percentage) / 100

            if isWon {
                updatedBalance = initial + ((percentage / 100) * initial)
            } else {
                updatedBalance = initial - ((percentage / 100) * initial)
            }
            percentageOfResult = (updateAmount * 100) / updatedBalance
            percentageOfAmount = String(format: "%.1f", percentage)
            amountDifference = String(format: "%.2f", updateAmount)
            currentBalance = String(format: "%.2f", updatedBalance)
            showResult = true

        } else if let initial = Double(initialBalance), let diff = Double(amountDifference) {
            var updatedBalance = initial + diff
            let updatePercentage = (diff / initial) * 100

            if isWon {
                updatedBalance = initial + diff
            } else {
                updatedBalance = initial - diff
            }
            percentageOfResult = (diff * 100) / updatedBalance
            percentageOfAmount = String(format: "%.2f", updatePercentage)
            amountDifference = String(format: "%.2f", diff)
            currentBalance = String(format: "%.2f", updatedBalance)
            showResult = true

        } else {
            showResult = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
