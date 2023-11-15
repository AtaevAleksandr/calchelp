//
//  Color.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import Foundation
import SwiftUI

extension Color {

    static let theme = ColorTheme()
}

struct ColorTheme {

    let background: Color = Color("BackgroundColor")
    let customMint: Color = Color("CustomMintColor")
    let backgroundComponents: Color = Color("BackgroundComponentsColor")
}
