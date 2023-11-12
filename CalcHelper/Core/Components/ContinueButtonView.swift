//
//  ContinueButtonView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct ContinueButtonView: View {

    let buttonName: String

    var body: some View {
        Text(buttonName)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 53)
            .frame(maxWidth: .infinity)
            .background(Color.theme.continueButtonColor)
            .cornerRadius(16)
            .onTapGesture {
                print("next")
            }
            .padding()
    }
}

struct ContinueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButtonView(buttonName: "Continue")
            .previewLayout(.sizeThatFits)
    }
}
