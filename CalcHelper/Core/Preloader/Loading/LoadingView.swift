//
//  LoadingView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI
import AppTrackingTransparency

struct LoadingView: View {

    @State private var isLoading: Bool = false
    @State private var rotation: Double = 0

    var body: some View {

        ZStack {
            OnboardingView()

            if isLoading {
                ZStack {
                    Color.theme.background
                        .ignoresSafeArea()
                    spinner
                }
            }
        }
        .onAppear() { fakeStartLoading() }
    }

    private func fakeStartLoading() {
        isLoading = true
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
            requestTrackingAuthorization()
        }
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            isLoading = false
        }
    }

    private func requestTrackingAuthorization() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                print("Tracking authorization granted")
            case .denied:
                print("Tracking authorization denied")
            case .notDetermined:
                print("Tracking authorization not determined")
            case .restricted:
                print("Tracking authorization restricted")
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    LoadingView()
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
