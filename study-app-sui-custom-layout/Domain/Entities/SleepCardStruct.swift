//
//  SleepCardStruct.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import Foundation

enum SleepCategory: String, CaseIterable {
    case all, my, sleep, kids, anxious
}

extension SleepCategory {
    var iconName: String {
        switch self {
        case .all:     return "icon-all"
        case .my:      return "icon-favorite"
        case .sleep:   return "icon-sleep"
        case .kids:    return "icon-kids"
        case .anxious: return "icon-anxious"
        }
    }
}

struct SleepCardStruct: Identifiable {
    let id: String = UUID().uuidString
    let sleepCards: [SleepCardItem]
    
    static func mockData() -> [SleepCardItem] {
        [
            SleepCardItem(title: "The ocean moon",
                          descr: "Non-stop 8-hour mixes of our most popular sleep audio",
                          timer: "50 min",
                          image: "picture-01", category: [.all, .sleep, .kids]),
            SleepCardItem(title: "Night Island",
                          descr: "Non-stop 45 min mixes of our most popular sleep audio",
                          timer: "45 min",
                          image: "picture-02", category: [.all, .sleep]),
            SleepCardItem(title: "Sweet Sleep",
                          descr: "Non-stop 40 min mixes of our most popular sleep audio",
                          timer: "40 min",
                          image: "picture-03", category: [.all, .kids, .sleep]),
            SleepCardItem(title: "Moon Sleep",
                          descr: "Non-stop 50 min mixes of our most popular sleep audio",
                          timer: "50 min",
                          image: "picture-04", category: [.all, .anxious]),
            SleepCardItem(title: "Cloud Sleep",
                          descr: "Non-stop 32 min mixes of our most popular sleep audio",
                          timer: "32 min",
                          image: "picture-05", category: [.all, .anxious]),
        ]
    }
}

struct SleepCardItem: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let descr: String
    let timer: String
    let image: String
    let category: [SleepCategory]
}
