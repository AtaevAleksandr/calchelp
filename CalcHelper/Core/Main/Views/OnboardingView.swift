//
//  OnboardingView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI
import UserNotifications

struct OnboardingView: View {

    @State private var onboardingState: Int = 0
    @State private var notificationAuthorization = false

    var body: some View {
        ZStack {
            switch onboardingState {
            case 0: WelcomeView()
            case 1: DirectAccessView()
            case 2: UpdatesView()
            case 3: DemoCalculators()
            case 4: RateView()
            case 5: GetStartedView()
            default: BackgroundView()
            }

            VStack {
                Spacer()
                bottomButton
            }
        }
    }
}

#Preview {
    OnboardingView()
}

// MARK: COMPONENTS
extension OnboardingView {
    private var bottomButton: some View {
        Text(onboardingState == 2 || onboardingState == 4 ? "Show" : "Continue")
        .font(.headline)
        .foregroundStyle(.white)
        .frame(height: 53)
        .frame(maxWidth: .infinity)
        .background(Color.theme.continueButtonColor)
        .cornerRadius(16)
        .animation(nil, value: UUID())
        .onTapGesture {
            handleContinuedButtonPressed()
        }
        .padding()
    }
}

// MARK: FUNCTIONS
extension OnboardingView {
    private func handleContinuedButtonPressed() {
        if onboardingState == 2 {
            requestAuthorization()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }

    private func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print ("ERROR: \(error)")
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.onboardingState += 1
                }
            }
        }
    }
}
