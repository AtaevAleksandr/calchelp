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

    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()

            SpinnerView(isLoading: $isLoading)

            if !isLoading {
                OnboardingView()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                requestTrackingAuthorization()
            }
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                isLoading = false
            }
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
