//
//  HomeView.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import SwiftUI

struct HomeView: View {
    
    let vm = HomeViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            HomeBackgroundView()

            ScrollView {
                Spacer(minLength: 4)
                
                VStack(alignment: .leading, spacing: 0) {
                    HomeHeaderView(title: "Sleep Stories",
                                   descr: "Soothing bedtime stories to help you fall \ninto a deep and natural sleep")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer(minLength: 26)
                
                CategoriesView(categories: vm.categories, currentCategory: vm.selectedCategory ?? .all, changeCat: vm.changeCategory)
                
                Spacer(minLength: 26)
                
                SleepCardItems(items: vm.getSleepCards())
            }
        }
        .frame(maxWidth: .infinity)
        .background(.appBg)
    }
}
