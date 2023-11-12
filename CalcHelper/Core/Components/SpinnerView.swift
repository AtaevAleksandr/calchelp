//
//  SpinnerView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct SpinnerView: View {

    @Binding var isLoading: Bool

    var body: some View {
        Image("Spinner")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(isLoading ? 360 : 0))
            .onAppear() {
                withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    isLoading.toggle()
                }
            }
            .padding()
    }
}

struct Previews_SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView(isLoading: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
