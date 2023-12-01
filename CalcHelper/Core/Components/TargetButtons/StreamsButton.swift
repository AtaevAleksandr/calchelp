//
//  StreamsButton.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 17.11.2023.
//

import SwiftUI

struct StreamsButton: View {

    @State var title: String
    @State var iconImage: String

    var body: some View {
        Button {
            openLink()
        } label: {
            VStack(alignment: .center) {
                Image(iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.theme.customMint)

                Text(title)
                    .font(.system(size: 16, weight: .medium))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 93)
        .foregroundStyle(.white)
        .background(Color.theme.backgroundComponents)
        .cornerRadius(16)
    }

    func openLink() {
        let urlString = "https://www.tradingview.com/streams/"
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

#Preview {
    StreamsButton(title: "Streams", iconImage: "Streams")
}
