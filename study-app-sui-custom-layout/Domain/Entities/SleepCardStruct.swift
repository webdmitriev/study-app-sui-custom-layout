//
//  SleepCardStruct.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import Foundation

struct SleepCardStruct: Identifiable {
    let id: String = UUID().uuidString
    let sleepCards: [SleepCardItem]
    
    static func mockData() -> [SleepCardItem] {
        [
            SleepCardItem(title: "The ocean moon",
                          descr: "Non-stop 8-hour mixes of our most popular sleep audio",
                          timer: "50 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Sleep"),
                            SleepCardItemCategory(category: "Kids")
                          ]),
            SleepCardItem(title: "Night Island",
                          descr: "Non-stop 45 min mixes of our most popular sleep audio",
                          timer: "45 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Sleep")
                          ]),
            SleepCardItem(title: "Sweet Sleep",
                          descr: "Non-stop 40 min mixes of our most popular sleep audio",
                          timer: "40 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Kids")
                          ]),
            SleepCardItem(title: "Moon Sleep",
                          descr: "Non-stop 50 min mixes of our most popular sleep audio",
                          timer: "50 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Anxious")
                          ]),
            SleepCardItem(title: "Cloud Sleep",
                          descr: "Non-stop 32 min mixes of our most popular sleep audio",
                          timer: "32 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Anxious")
                          ]),
        ]
    }
}

struct SleepCardItem: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let descr: String
    let timer: String
    let image: String
    let category: [SleepCardItemCategory]
}

struct SleepCardItemCategory: Identifiable {
    let id: String = UUID().uuidString
    let category: String
}
