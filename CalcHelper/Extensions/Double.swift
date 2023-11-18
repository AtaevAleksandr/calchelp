//
//  Double.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 18.11.2023.
//

import Foundation

extension Double {

    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    func valueWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "0,00"
    }
}
