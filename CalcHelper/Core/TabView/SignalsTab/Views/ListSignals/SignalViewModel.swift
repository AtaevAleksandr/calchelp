//
//  SignalViewModel.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 25.11.2023.
//

import Foundation

final class SignalViewModel: ObservableObject {

    @Published var rows: [SignalModel] = SignalModel.components

    func updateSignals(forRisk risk: String) {
        switch risk {
        case "Low":
            rows = randomSignals
        case "Normal":
            rows = randomSignals
        case "High":
            rows = randomSignals
        default:
            break
        }
    }

    var randomSignals: [SignalModel] {
        return Array(rows.shuffled().prefix(Int.random(in: 4...6)))
    }
}
