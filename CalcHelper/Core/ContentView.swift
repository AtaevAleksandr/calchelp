//
//  ContentView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 12.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hello, world!")
            }
            .foregroundStyle(Color.green)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
