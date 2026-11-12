//
//  HomeView.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            HomeBackgroundView()

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HomeHeaderView(title: "Sleep Stories",
                                   descr: "Soothing bedtime stories to help you fall \ninto a deep and natural sleep")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.appBg)
    }
}
