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
                .padding(.horizontal)
            Spacer()

            ZStack {
                blurEllipse
                phone
                    .overlay(backgroundPhone, alignment: .bottom)
                notifications
            }
        }
    }


}


//MARK: COMPONENTS
extension DemoPhoneView {

    private var blurEllipse: some View {
        Image("Blur")
            .resizable()
    }

    private var phone: some View {
        Image("iPhone")
            .resizable()
            .scaledToFit()
            .offset(y: 90)
            .padding(.horizontal, 50)
    }

    private var notifications: some View {
        Image("Notification")
            .resizable()
            .scaledToFit()
            .offset(y: 15)
            .padding(.horizontal)
    }

    private var backgroundPhone: some View {
        Image("BackgroundiPhone")
            .resizable()
            .scaledToFit()
            .offset(y: 90)
    }
}
