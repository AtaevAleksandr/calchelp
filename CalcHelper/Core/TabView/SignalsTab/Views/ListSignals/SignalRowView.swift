//
//  SignalRowView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 25.11.2023.
//

import SwiftUI

struct SignalRowView: View {

    let signal: SignalModel

    var body: some View {
        VStack {
            HStack {
                Image(signal.iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)

                Text(signal.name)
                    .font(.system(size: 16, weight: .medium))

                Spacer()

                Text(LocalizedStringKey(signal.status.displayText))
                    .font(.system(size: 14, weight: .medium))
                    .padding(.horizontal)
                    .frame(height: 25)
                    .background(
                        signal.status.backgroundColor
                    )
                    .cornerRadius(10)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.theme.backgroundComponents)
            .cornerRadius(16)
        }
    }
}
