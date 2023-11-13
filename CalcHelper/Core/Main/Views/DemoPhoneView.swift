//
//  DemoPhoneView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct DemoPhoneView: View {
    var body: some View {
        VStack {
            Text("Don't miss new updates")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.top)
            Spacer()

            ZStack {
                blurEllipse
                phone
                notifications
                backgroundPhone
            }
        }
    }


}

#Preview {
    ZStack {
        BackgroundView()
        DemoPhoneView()
    }
}

//MARK: COMPONENTS
extension DemoPhoneView {

    private var blurEllipse: some View {
        Ellipse()
            .foregroundStyle(Color.theme.customMint)
            .frame(width: 230, height: 500)
            .blur(radius: 50)
            .offset(y: -60)
            .padding(.horizontal)
    }

    private var phone: some View {
        Image("iPhone")
            .resizable()
            .scaledToFit()
            .offset(y: 36)
            .padding(.horizontal, 50)
    }

    private var notifications: some View {
        Image("Notification")
            .resizable()
            .scaledToFit()
            .offset(y: -40)
            .padding(.horizontal)
    }

    private var backgroundPhone: some View {
        Image("BackgroundiPhone")
            .resizable()
            .scaledToFit()
            .offset(y: 115)
    }
}
