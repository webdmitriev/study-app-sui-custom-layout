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
                          descr: "Non-stop 8- hour mixes of our most popular sleep audio",
                          timer: "50 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Sleep"),
                            SleepCardItemCategory(category: "Kids")
                          ]),
            SleepCardItem(title: "Night Island",
                          descr: "",
                          timer: "45 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Sleep")
                          ]),
            SleepCardItem(title: "Sweet Sleep",
                          descr: "",
                          timer: "40 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Kids")
                          ]),
            SleepCardItem(title: "Moon Sleep",
                          descr: "",
                          timer: "40 min",
                          image: "", category: [
                            SleepCardItemCategory(category: "Anxious")
                          ]),
            SleepCardItem(title: "Cloud Sleep",
                          descr: "",
                          timer: "40 min",
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
