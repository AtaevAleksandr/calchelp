//
//  ListRowViewModel.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 18.11.2023.
//

import Foundation

final class ListRowViewModel: ObservableObject {

    @Published var rows: [LisRowViewComponent] = LisRowViewComponent.components
}
