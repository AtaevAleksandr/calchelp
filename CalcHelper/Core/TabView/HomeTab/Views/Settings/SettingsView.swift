//
//  SettingsView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 17.11.2023.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ZStack() {
                BackgroundTabView()

                VStack {
                    PrivacyPolicyButton(title: "Privacy Policy", iconImage: "Privacy")
                    SupportAppButton(title: "Support App", iconImage: "Support")

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { dissmissButton }
        }
    }
}

//MARK: COMPONENTS
extension SettingsView {
    private var dissmissButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}
