//
//  RowModel.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 19.11.2023.
//

import Foundation

struct RowModel: Identifiable {
    let id = UUID()
    let value: String
    let direct: Double
    let reverse: Double

    static var components: [RowModel]  = [
        RowModel(value: "100.0% Retracement Value",
                            direct: 0,
                            reverse: 0),
        RowModel(value: "61.8% Retracement Value",
                            direct: 0,
                            reverse: 0),
        RowModel(value: "50.0% Retracement Value",
                            direct: 0,
                            reverse: 0),
        RowModel(value: "38.2% Retracement Value",
                            direct: 0,
                            reverse: 0),
        RowModel(value: "23.6% Retracement Value",
                            direct: 0,
                            reverse: 0),
        RowModel(value: "0.0% Retracement Value",
                            direct: 0,
                            reverse: 0)
    ]
}


