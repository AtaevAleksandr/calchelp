//
//  OnboardingView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct OnboardingView: View {

    @State var onboardingState: Int = 1

    var body: some View {
        ZStack {
            switch onboardingState {
            case 0: WelcomeView()
            case 1: DirectAccessView()
            default: EmptyView()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
