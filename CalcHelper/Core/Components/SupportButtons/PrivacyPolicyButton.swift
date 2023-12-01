//
//  PrivacyPolicyButton.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 17.11.2023.
//

import SwiftUI

struct PrivacyPolicyButton: View {

    @State var title: String
    @State var iconImage: String

    var body: some View {
        Button {
            openLink()
        } label: {
            HStack() {
                Image(iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color.theme.customMint)

                Text(title)
                    .font(.system(size: 18, weight: .medium))

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 76)
        .foregroundStyle(.white)
        .background(Color.theme.backgroundComponents)
        .cornerRadius(16)
    }

    func openLink() {
        let urlString = "https://www.freeprivacypolicy.com/live/7af38c28-4f06-49cc-8540-3ea9e2ecfbca"
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

#Preview {
    PrivacyPolicyButton(title: "Privacy Policy", iconImage: "Privacy")
}
