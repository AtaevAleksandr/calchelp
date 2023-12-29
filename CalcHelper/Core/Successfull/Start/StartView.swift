//
//  StartView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 05.12.2023.
//

import SwiftUI

struct StartView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Text("Congratulations! \nYour demo account is \ngrowing. Start earning from your first deposit now!")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding(.horizontal)
                Spacer()

                Image("Arrows")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 200)
                Spacer()
                Spacer()

                Button {
                    dismiss()
                } label: {
                    Text("Continue")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 53)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.customMint)
                    .cornerRadius(16)
                    .padding()
                }
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    StartView()
}
