//
//  BackgroundTabView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 14.11.2023.
//

import SwiftUI

struct BackgroundTabView: View {
    var body: some View {
        Color.theme.background
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundTabView()
}
