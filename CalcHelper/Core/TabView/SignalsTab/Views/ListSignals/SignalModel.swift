//
//  SignalModel.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 25.11.2023.
//

import Foundation
import SwiftUI

enum Status: Codable, CaseIterable {
    case sell
    case strongSell
    case buy
    case strongBuy

    var displayText: String {
        switch self {
        case .sell:
            return "Sell"
        case .strongSell:
            return "Strong Sell"
        case .buy:
            return "Buy"
        case .strongBuy:
            return "Strong Buy"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .sell, .strongSell:
            return Color.theme.customRed
        case .buy, .strongBuy:
            return Color.theme.customGreen
        }
    }

    static func randomStatus() -> Status {
        let allCases = self.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}

struct SignalModel: Codable, Identifiable {
    var id = UUID()
    let iconImage: String
    let name: String
    let status: Status

    static var lowSignals: [SignalModel] = [
        SignalModel(iconImage: "AUD:CAD", name: "AUD/CAD", status: .randomStatus()),
        SignalModel(iconImage: "AUD:CHF", name: "AUD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "AUD:JPY", name: "AUD/JPY", status: .randomStatus()),
        SignalModel(iconImage: "AUD:USD", name: "AUD/USD", status: .randomStatus()),
        SignalModel(iconImage: "CAD:CHF", name: "CAD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "CAD:JPY", name: "CAD/JPY", status: .randomStatus()),
        SignalModel(iconImage: "EUR:CAD", name: "EUR/CAD", status: .randomStatus()),
        SignalModel(iconImage: "EUR:CHF", name: "EUR/CHF", status: .randomStatus()),
        SignalModel(iconImage: "EUR:GBP", name: "EUR/GBP", status: .randomStatus()),
        SignalModel(iconImage: "EUR:JPY", name: "EUR/JPY", status: .randomStatus()),
        SignalModel(iconImage: "EUR:USD", name: "EUR/USD", status: .randomStatus()),
        SignalModel(iconImage: "GBP:AUD", name: "GBP/AUD", status: .randomStatus()),
        SignalModel(iconImage: "GBP:CHF", name: "GBP/CHF", status: .randomStatus()),
        SignalModel(iconImage: "GBP:JPY", name: "GBP/JPY", status: .randomStatus()),
        SignalModel(iconImage: "GBP:USD", name: "GBP/USD", status: .randomStatus()),
        SignalModel(iconImage: "USD:CAD", name: "USD/CAD", status: .randomStatus()),
        SignalModel(iconImage: "USD:CHF", name: "USD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "USD:JPY", name: "USD/JPY", status: .randomStatus())
    ]

    static var normalSignals: [SignalModel] = [
        SignalModel(iconImage: "AUD:CAD", name: "AUD/CAD", status: .randomStatus()),
        SignalModel(iconImage: "AUD:CHF", name: "AUD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "AUD:JPY", name: "AUD/JPY", status: .randomStatus()),
        SignalModel(iconImage: "AUD:USD", name: "AUD/USD", status: .randomStatus()),
        SignalModel(iconImage: "CAD:CHF", name: "CAD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "CAD:JPY", name: "CAD/JPY", status: .randomStatus()),
        SignalModel(iconImage: "EUR:CAD", name: "EUR/CAD", status: .randomStatus()),
        SignalModel(iconImage: "EUR:CHF", name: "EUR/CHF", status: .randomStatus()),
        SignalModel(iconImage: "EUR:GBP", name: "EUR/GBP", status: .randomStatus()),
        SignalModel(iconImage: "EUR:JPY", name: "EUR/JPY", status: .randomStatus()),
        SignalModel(iconImage: "EUR:USD", name: "EUR/USD", status: .randomStatus()),
        SignalModel(iconImage: "GBP:AUD", name: "GBP/AUD", status: .randomStatus()),
        SignalModel(iconImage: "GBP:CHF", name: "GBP/CHF", status: .randomStatus()),
        SignalModel(iconImage: "GBP:JPY", name: "GBP/JPY", status: .randomStatus()),
        SignalModel(iconImage: "GBP:USD", name: "GBP/USD", status: .randomStatus()),
        SignalModel(iconImage: "USD:CAD", name: "USD/CAD", status: .randomStatus()),
        SignalModel(iconImage: "USD:CHF", name: "USD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "USD:JPY", name: "USD/JPY", status: .randomStatus())
    ]

    static var highSignals: [SignalModel] = [
        SignalModel(iconImage: "AUD:CAD", name: "AUD/CAD", status: .randomStatus()),
        SignalModel(iconImage: "AUD:CHF", name: "AUD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "AUD:JPY", name: "AUD/JPY", status: .randomStatus()),
        SignalModel(iconImage: "AUD:USD", name: "AUD/USD", status: .randomStatus()),
        SignalModel(iconImage: "CAD:CHF", name: "CAD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "CAD:JPY", name: "CAD/JPY", status: .randomStatus()),
        SignalModel(iconImage: "EUR:CAD", name: "EUR/CAD", status: .randomStatus()),
        SignalModel(iconImage: "EUR:CHF", name: "EUR/CHF", status: .randomStatus()),
        SignalModel(iconImage: "EUR:GBP", name: "EUR/GBP", status: .randomStatus()),
        SignalModel(iconImage: "EUR:JPY", name: "EUR/JPY", status: .randomStatus()),
        SignalModel(iconImage: "EUR:USD", name: "EUR/USD", status: .randomStatus()),
        SignalModel(iconImage: "GBP:AUD", name: "GBP/AUD", status: .randomStatus()),
        SignalModel(iconImage: "GBP:CHF", name: "GBP/CHF", status: .randomStatus()),
        SignalModel(iconImage: "GBP:JPY", name: "GBP/JPY", status: .randomStatus()),
        SignalModel(iconImage: "GBP:USD", name: "GBP/USD", status: .randomStatus()),
        SignalModel(iconImage: "USD:CAD", name: "USD/CAD", status: .randomStatus()),
        SignalModel(iconImage: "USD:CHF", name: "USD/CHF", status: .randomStatus()),
        SignalModel(iconImage: "USD:JPY", name: "USD/JPY", status: .randomStatus())
    ]
}
