//
//  HomeViewModel.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import SwiftUI

@Observable
class HomeViewModel {
    let sleepCards: [SleepCardItem] = SleepCardStruct.mockData()
    var categories: [SleepCategory] { SleepCategory.allCases }
    
    var selectedCategory: SleepCategory? = nil
    
    func getSleepCards() -> [SleepCardItem] {
        guard let cat = selectedCategory else { return sleepCards }
        return sleepCards.filter { $0.category.contains(cat) }
    }
}
