//
//  BackgroundView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()

            VStack {
//                Spacer()
//                Spacer()
//                Spacer()



                Image("Lines")
                    .resizable()
                    .scaledToFit()
//                Spacer()

            }

                            .offset(y: 150)

        }

    }
}

#Preview {
    BackgroundView()
}
