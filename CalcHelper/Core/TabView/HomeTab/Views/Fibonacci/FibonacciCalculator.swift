//
//  FibonacciCalculator.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 18.11.2023.
//

import SwiftUI

struct FibonacciCalculator: View {

    @Environment(\.dismiss) var dissmiss
    @Binding var showFibonacci: Bool

    @State private var highPrice: String = ""
    @State private var lowPrice: String = ""
    @StateObject private var viewModel: ListRowViewModel = ListRowViewModel()

    @State private var fib100Direct: Double = 0
    @State private var fib618Direct: Double = 0
    @State private var fib50Direct: Double = 0
    @State private var fib382Direct: Double = 0
    @State private var fib236Direct: Double = 0
    @State private var fib0Direct: Double = 0

    @State private var fib100Reverse: Double = 0
    @State private var fib618Reverse: Double = 0
    @State private var fib50Reverse: Double = 0
    @State private var fib382Reverse: Double = 0
    @State private var fib236Reverse: Double = 0
    @State private var fib0Reverse: Double = 0

    var body: some View {
        NavigationView {
            ZStack() {
                BackgroundTabView()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        descriptionText

                        HStack {
                            highPriceTextField
                            lowPriceTextField
                        }
                        .padding(.vertical)

                        calculateButton

                        columnTitles

                        listOfValues
                    }
                    .padding()
                }
            }
            .navigationTitle("Fibonacci")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { dissmissButton }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }

    //MARK: FUNCTIONS
    private func calculateFibonacciLevels() {
        guard let lowPriceValue = Double(lowPrice),
              let highPriceValue = Double(highPrice) else {
            return
        }

        let priceRange = highPriceValue - lowPriceValue

        fib100Direct = lowPriceValue + 1 * priceRange
        fib618Direct = lowPriceValue + 0.618 * priceRange
        fib50Direct = lowPriceValue + 0.5 * priceRange
        fib382Direct = lowPriceValue + 0.382 * priceRange
        fib236Direct = lowPriceValue + 0.236 * priceRange
        fib0Direct = lowPriceValue + 0 * priceRange

        fib100Reverse = calculateReverse(level: 1)
        fib618Reverse = calculateReverse(level: 0.618)
        fib50Reverse = calculateReverse(level: 0.5)
        fib382Reverse = calculateReverse(level: 0.382)
        fib236Reverse = calculateReverse(level: 0.236)
        fib0Reverse = calculateReverse(level: 0)

        viewModel.rows = [
            LisRowViewComponent(value: "100.0% Retracement Value", 
                                direct: fib100Direct,
                                reverse: fib100Reverse),
            LisRowViewComponent(value: "61.8% Retracement Value", 
                                direct: fib618Direct, 
                                reverse: fib618Reverse),
            LisRowViewComponent(value: "50.0% Retracement Value",
                                direct: fib50Direct, 
                                reverse: fib50Reverse),
            LisRowViewComponent(value: "38.2% Retracement Value",
                                direct: fib382Direct, 
                                reverse: fib382Reverse),
            LisRowViewComponent(value: "23.6% Retracement Value",
                                direct: fib236Direct,
                                reverse: fib236Reverse),
            LisRowViewComponent(value: "0.0% Retracement Value",
                                direct: fib0Direct, 
                                reverse: fib0Reverse)
        ]

        highPrice = ""
        lowPrice = ""
    }

    private func calculateReverse(level: Double) -> Double {
        guard let minPriceValue = Double(lowPrice),
              let maxPriceValue = Double(highPrice) else {
            return 0.0
        }

        return maxPriceValue - (maxPriceValue - minPriceValue) * level
    }
}

#Preview {
    FibonacciCalculator(showFibonacci: .constant(false))
        .preferredColorScheme(.dark)
}

//MARK: COMPONENTS
extension FibonacciCalculator {
    private var descriptionText: some View {
        Text("""
             The presented Fibonacci calculator will help you to generate four basic Fibonacci retracement values — 23.6%, 38.2%, 50% and 61.8%. All you need to do is to fill the current trend's highest and lowest values into the form below and press the "Calculate" button.
             """)
        .padding()
        .font(.system(size: 16, weight: .regular))
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(Color.theme.backgroundComponents)
        .cornerRadius(16)
    }

    private var highPriceTextField: some View {
        VStack(alignment: .leading) {
            Text("High price")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)

            TextField("", text: $highPrice)
                .padding(.horizontal)
                .frame(height: 45)
                .background(Color.theme.backgroundComponents)
                .cornerRadius(10)
                .keyboardType(.numberPad)
        }
    }

    private var lowPriceTextField: some View {
        VStack(alignment: .leading) {
            Text("Low price")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)

            TextField("", text: $lowPrice)
                .padding(.horizontal)
                .frame(height: 45)
                .background(Color.theme.backgroundComponents)
                .cornerRadius(10)
                .keyboardType(.numberPad)
        }
    }

    private var calculateButton: some View {
        Button {
            withAnimation(.spring) {
                calculateFibonacciLevels()
            }
        } label: {
            Text("Calculate")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 53)
                .frame(maxWidth: .infinity)
                .background(Color.theme.customMint)
                .cornerRadius(16)
        }
    }

    private var dissmissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                showFibonacci.toggle()
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

    private var columnTitles: some View {
        HStack {
            Text("Results")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .regular))
            Spacer()
            Text("Direct")
            Text("Reverse")
                .frame(width: UIScreen.main.bounds.width / 6.0, alignment: .trailing)
        }
        .font(.system(size: 14, weight: .regular))
        .foregroundStyle(.gray)
        .padding(.top)
    }

    private var listOfValues: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.rows, id: \.id) { component in
                HStack {
                    Text(component.value)
                    Spacer()
                    Spacer()

                    Text("\(String(format: "%.2f", component.direct))")
                    Spacer()
                    Text("\(String(format: "%.2f", component.reverse))")
                }
                .padding()
                .font(.system(size: 14, weight: .regular))
                Divider()
                    .padding(.leading)
            }
            .frame(maxWidth: .infinity)
            .background(Color.theme.backgroundComponents)
        }
        .cornerRadius(16)
        .padding(.top, 0)
    }
}
