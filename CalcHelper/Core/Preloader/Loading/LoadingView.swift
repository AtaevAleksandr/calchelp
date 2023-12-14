//
//  LoadingView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI
import AppTrackingTransparency

struct LoadingView: View {

    @AppStorage("isAlredyOnboarding") var isAlredyOnboarding: Bool = false

    @State private var isInitialLoadingCompleted: Bool = false
    @State private var isLoading: Bool = false
    @State private var rotation: Double = 0

    var body: some View {
        ZStack {
            if isAlredyOnboarding && isInitialLoadingCompleted {
                SwiftUIView()
            } else {
                OnboardingView()
            }

            if isLoading {
                ZStack {
                    Color.theme.background
                        .ignoresSafeArea()
                    spinner
                }
            }
        }
        .onAppear() {
            if !isInitialLoadingCompleted {
                fakeStartLoading()
            }
        }
    }

    private func fakeStartLoading() {
        isLoading = true
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
            requestTrackingAuthorization()
        }
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            isLoading = false
            isInitialLoadingCompleted = true
        }
    }

    private func requestTrackingAuthorization() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                break
            case .denied:
                break
            case .notDetermined:
                break
            case .restricted:
                break
            @unknown default:
                break
            }
        }
    }
}


// MARK: COMPONENTS
extension LoadingView {
    private var spinner: some View {
        Image("Spinner")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: rotation))
            .animation(.linear(duration: 1.0).repeatForever(autoreverses: false), value: UUID())
            .onAppear() {
                self.rotation = 360.0
            }
    }
}
