//
//  CalcHelperApp.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

@main
struct CalcHelperApp: App {

    @StateObject private var vm = SignalViewModel()

    var body: some Scene {
        WindowGroup {
            LoadingView()
                .preferredColorScheme(.dark)
                .environmentObject(vm)
        }
    }
}
