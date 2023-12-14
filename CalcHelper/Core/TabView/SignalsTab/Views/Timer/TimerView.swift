//
//  TimerView.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 25.11.2023.
//

import SwiftUI

struct TimerView: View {

    @State private var timerText: String = ""

    @State private var nextUpdateTime: Date = {
        let calendar = Calendar.current
        let endOfDay = calendar.startOfDay(for: Date()).addingTimeInterval(86400)
        return endOfDay
    }()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                ForEach(Array(timerText.enumerated()), id: \.offset) { index, char in
                    if char.isNumber {
                        Text(String(char))
                            .font(.system(size: 44, weight: .bold))
                            .frame(width: 55, height: 72)
                            .foregroundColor(.white)
                            .background(Color.theme.customMint)
                            .cornerRadius(10)
                            .padding(.horizontal, 4)
                    } else {
                        Text(String(char))
                            .font(.system(size: 50, weight: .bold))
                            .padding(.horizontal, 4)
                    }
                }
            }
            .onReceive(timer) { _ in
                updateTimer()
            }
        }
        .onAppear {
            updateTimer()
        }
    }

    //MARK: FUNCTIONS
    func updateTimer() {
        let currentTime = Date()
        let calendar = Calendar.current

        if currentTime >= nextUpdateTime {
            nextUpdateTime = calendar.startOfDay(for: currentTime).addingTimeInterval(86400)
        }

        let timeLeft = calendar.dateComponents([.hour, .minute], from: currentTime, to: nextUpdateTime)

        if let hour = timeLeft.hour, let minute = timeLeft.minute {
            timerText = String(format: "%02d:%02d", hour, minute)
        }
    }
}

