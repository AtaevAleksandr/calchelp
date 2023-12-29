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
    @State private var isFirstLaunch: Bool = false
    @AppStorage("isNotificationPermissionGranted") var isNotificationPermissionGranted: Bool = false
    @State private var isShowViewIn2Min: Bool = false
    @State private var isShowViewEvery3Time: Bool = false
    @State private var isAppearViewEvery3Time: Bool = false

    @AppStorage("launchCount") private var launchCount: Int = 0
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
        .fullScreenCover(isPresented: $isShowViewIn2Min) {
            DemoSignalsView(showView: $isShowViewIn2Min)
        }
        .fullScreenCover(isPresented: $isShowViewEvery3Time) {
            DemoSignalsView(showView: $isShowViewEvery3Time)
        }
        .onAppear() {
            if !isInitialLoadingCompleted {
                fakeStartLoading()
            }

            launchCount += 1

            if !isNotificationPermissionGranted {
                if !self.isFirstLaunch {

                    if !isNotificationPermissionGranted && launchCount % 3 != 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.isShowViewIn2Min = true
                        }
                    }

                    if !isNotificationPermissionGranted && launchCount % 3 == 0 {
                        self.isShowViewEvery3Time = true
                    }
                }
            }
        }
    }

    private func fakeStartLoading() {
        isLoading = true
        checkNotificationPermission()

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

    func checkNotificationPermission() {
        let center = UNUserNotificationCenter.current()

        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.isNotificationPermissionGranted = true
            case .denied:
                break
            case .notDetermined:
                break
            case .provisional:
                break
            case .ephemeral:
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
            .onAppear {
                self.rotation = 360.0
            }
    }
}
