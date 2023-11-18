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

    @State var textFieldHighPrice: String = ""
    @State var textFieldLowPrice: String = ""

    let viewModel: ListRowViewModel = ListRowViewModel()

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
}

#Preview {
    FibonacciCalculator(showFibonacci: .constant(false))
        .preferredColorScheme(.dark)
}

//MARK: COMPONENTS
extension FibonacciCalculator {
    private var descriptionText: some View {
        Text("""
             The presented Fibonacci calculator will help you to generate four basic Fibonacci retracement values — 23.8%, 38.2%, 50% and 61.8%. All you need to do is to fill the current trend's highest and lowest values into the form below and press the "Calculate" button.
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

            TextField("high price", text: $textFieldHighPrice)
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

            TextField("low price", text: $textFieldLowPrice)
                .padding(.horizontal)
                .frame(height: 45)
                .background(Color.theme.backgroundComponents)
                .cornerRadius(10)
                .keyboardType(.numberPad)
        }
    }

    private var calculateButton: some View {
        Button {
            print("calculate")
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
            ForEach(viewModel.components) { component in
                HStack {
                    Text(component.value)
                    Spacer()
                    Spacer()

                    Text("\(component.direct.valueWith2Decimals())")
                    Spacer()
                    Text("\(component.reverse.valueWith2Decimals())")
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
