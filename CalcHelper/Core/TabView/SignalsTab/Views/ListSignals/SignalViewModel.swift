//
//  SignalViewModel.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 25.11.2023.
//

import Foundation

final class SignalViewModel: ObservableObject {

    @Published var allLowSignals: [String: [SignalModel]] = ["": SignalModel.lowSignals]
    @Published var allNormalSignals: [String: [SignalModel]] = ["": SignalModel.normalSignals]
    @Published var allHighSignals: [String: [SignalModel]] = ["": SignalModel.highSignals]

    @Published var lastGeneratedForLowDate: String?
    @Published var lastGeneratedForNormalDate: String?
    @Published var lastGeneratedForHighDate: String?

    //MARK: GENERATE DATA
    func generateRandomLowSignalData() {
        let currentDate = formattedDate()

        if lastGeneratedForLowDate != currentDate {
            var signalData: [SignalModel] = SignalModel.lowSignals

            signalData.shuffle()

            let randomData: [SignalModel] = Array(signalData.prefix(Int.random(in: 4...6))).map { originalSignal in
                var randomSignalModel = originalSignal
                randomSignalModel.id = UUID()
                return randomSignalModel
            }

            allLowSignals[currentDate] = randomData
            lastGeneratedForLowDate = currentDate

            objectWillChange.send()

            saveLowSignalData()
        }
    }

    func generateRandomNormalSignalData() {
        let currentDate = formattedDate()

        if lastGeneratedForNormalDate != currentDate {
            var signalData: [SignalModel] = SignalModel.normalSignals

            signalData.shuffle()

            let randomData: [SignalModel] = Array(signalData.prefix(Int.random(in: 4...4))).map { originalSignal in
                var randomSignalModel = originalSignal
                randomSignalModel.id = UUID()
                return randomSignalModel
            }

            allNormalSignals[currentDate] = randomData
            lastGeneratedForNormalDate = currentDate

            objectWillChange.send()

            saveNormalSignalData()
        }
    }

    func generateRandomHighSignalData() {
        let currentDate = formattedDate()

        if lastGeneratedForHighDate != currentDate {
            var signalData: [SignalModel] = SignalModel.highSignals

            signalData.shuffle()

            let randomData: [SignalModel] = Array(signalData.prefix(Int.random(in: 4...5))).map { originalSignal in
                var randomSignalModel = originalSignal
                randomSignalModel.id = UUID()
                return randomSignalModel
            }

            allHighSignals[currentDate] = randomData
            lastGeneratedForHighDate = currentDate

            objectWillChange.send()

            saveHighSignalData()
        }
    }

    //MARK: LOAD DATA
    func loadLowSignalData() {
        if let lowSignaldata = UserDefaults.standard.data(forKey: "LowSignalData"),
           let savedLowSignalData = try? JSONDecoder().decode([String: [SignalModel]].self, from: lowSignaldata) {
            allLowSignals = savedLowSignalData
        }

        lastGeneratedForLowDate = UserDefaults.standard.string(forKey: "LastGeneratedForLowDate")
    }

    func loadNormalSignalData() {
        if let normalSignaldata = UserDefaults.standard.data(forKey: "NormalSignalData"),
           let savedNormalSignalData = try? JSONDecoder().decode([String: [SignalModel]].self, from: normalSignaldata) {
            allNormalSignals = savedNormalSignalData
        }

        lastGeneratedForNormalDate = UserDefaults.standard.string(forKey: "LastGeneratedForNormalDate")
    }

    func loadHighSignalData() {
        if let highSignaldata = UserDefaults.standard.data(forKey: "HighSignalData"),
           let savedHighSignalData = try? JSONDecoder().decode([String: [SignalModel]].self, from: highSignaldata) {
            allHighSignals = savedHighSignalData
        }

        lastGeneratedForHighDate = UserDefaults.standard.string(forKey: "LastGeneratedForHighDate")
    }

    //MARK: SAVE DATA
    func saveLowSignalData() {
        if let encodedlowSignalData = try? JSONEncoder().encode(allLowSignals) {
            UserDefaults.standard.set(encodedlowSignalData, forKey: "LowSignalData")
        }

        UserDefaults.standard.set(lastGeneratedForLowDate, forKey: "LastGeneratedForLowDate")
    }

    func saveNormalSignalData() {
        if let encodedNormalSignalData = try? JSONEncoder().encode(allNormalSignals) {
            UserDefaults.standard.set(encodedNormalSignalData, forKey: "NormalSignalData")
        }

        UserDefaults.standard.set(lastGeneratedForNormalDate, forKey: "LastGeneratedForNormalDate")
    }

    func saveHighSignalData() {
        if let encodedHighSignalData = try? JSONEncoder().encode(allHighSignals) {
            UserDefaults.standard.set(encodedHighSignalData, forKey: "HighSignalData")
        }

        UserDefaults.standard.set(lastGeneratedForHighDate, forKey: "LastGeneratedForHighDate")
    }

    //MARK: Formatted Date
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
}
