//
//  SignalsStoreManager.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 25.11.2023.
//

import Foundation

final class SignalsStoreManager {

    var lastRequestDate: Date? {
        get {
            return UserDefaults.standard.object(forKey: "lastRequestDateKey") as? Date
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "lastRequestDateKey")
        }
    }

    func checkIfRequestNeeded() -> Bool {
        let currentDate = Date()

        // Use the Calendar class to get the components of the current date
        let calendar = Calendar.current
        let currentDay = calendar.component(.day, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentYear = calendar.component(.year, from: currentDate)

        // If the last request date is nil or is from a different day than today
        if lastRequestDate == nil || !calendar.isDate(lastRequestDate!, inSameDayAs: currentDate) {
            // Update the last request date to today's date
            lastRequestDate = calendar.date(from: DateComponents(year: currentYear, month: currentMonth, day: currentDay))
            return true
        }

        return false
    }
}
