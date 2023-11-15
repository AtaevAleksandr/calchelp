//
//  OnboardingView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI
import UserNotifications
import StoreKit

struct OnboardingView: View {

    @State private var onboardingState: Int = 0
    @State private var notificationAuthorization: Bool = false
    @Binding var currentShowView: Bool

    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))

    var body: some View {
        ZStack {
            BackgroundView()

            switch onboardingState {
            case 0: WelcomeView()
                    .transition(transition)
            case 1: DemoTargetsView()
                    .transition(transition)
            case 2: DemoPhoneView()
                    .transition(transition)
            case 3: DemoCalculatorsView()
                    .transition(transition)
            case 4: RateView()
                    .transition(transition)
            case 5: GetStartedView()
                    .transition(transition)
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
    OnboardingView(currentShowView: .constant(false))
}

// MARK: COMPONENTS
extension OnboardingView {
    private var bottomButton: some View {

        Text(onboardingState == 5 ?
             "Get Started" : onboardingState == 2 || onboardingState == 4 ?
             "Show" : "Continue")
        .font(.headline)
        .foregroundStyle(.white)
        .frame(height: 53)
        .frame(maxWidth: .infinity)
        .background(Color.theme.customMint)
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
        } else if onboardingState == 4 {
            requestReview()
        } else if onboardingState == 5 {
            goToTabView()
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
                    withAnimation(.spring()) {
                        self.onboardingState += 1
                    }
                }
            }
        }
    }

    private func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.spring()) {
                    onboardingState += 1
                }
            }
        }
    }

    private func goToTabView() {
        withAnimation(.spring()) {
            currentShowView = true
        }
    }
}
