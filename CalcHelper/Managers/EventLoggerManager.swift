//
//  EventLoggerManager.swift
//  CalcHelper
//
//  Created by Aleksandr Ataev on 09.12.2023.
//

import Foundation

final class EventLoggerManager {
    static let shared = EventLoggerManager()

    private init() {}

    enum Events: String {
        case onboardingStart = "onboarding_start"
        case onboardingFinish = "onboarding_finish"

        case homeTab = "home_tab"
        case glossaryTab = "glossary_tab"
        case signalsTab = "signals_tab"

        case event1Success = "event1_success"
        case event2Success = "event2_success"

        case pushOpened = "push_sub_opened"
        case pushEvent1Opened = "push_event1_opened"
        case pushEvent2Opened = "push_event2_opened"
    }

}

