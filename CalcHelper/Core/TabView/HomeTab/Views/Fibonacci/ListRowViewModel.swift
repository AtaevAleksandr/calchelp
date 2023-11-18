//
//  ListRowViewModel.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 18.11.2023.
//

import Foundation

final class ListRowViewModel: ObservableObject {

    struct LisRowViewComponent: Identifiable {
        let id = UUID()
        let value: String
        let direct: Double
        let reverse: Double
    }

    var components: [LisRowViewComponent] {
        [
            LisRowViewComponent(value: "100.0% Retracement Value", direct: 0.00, reverse: 0.00),
            LisRowViewComponent(value: "61.8% Retracement Value", direct: 0.00, reverse: 0.00),
            LisRowViewComponent(value: "50.0% Retracement Value", direct: 0.00, reverse: 0.00),
            LisRowViewComponent(value: "38.2% Retracement Value", direct: 0.00, reverse: 0.00),
            LisRowViewComponent(value: "23.6% Retracement Value", direct: 0.00, reverse: 0.00),
            LisRowViewComponent(value: "0.0% Retracement Value", direct: 0.00, reverse: 0.00)
        ]
    }
}
