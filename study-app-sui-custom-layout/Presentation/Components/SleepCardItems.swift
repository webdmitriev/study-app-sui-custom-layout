//
//  SleepCardItems.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 14.11.2026.
//

import SwiftUI

struct SleepCardItems: View {
    var items: [SleepCardItem]

    var body: some View {
        if items.isEmpty {
            VStack(spacing: 8) {
                Text("Здесь пока пусто")
                    .modifier(TextModifier(fontSize: AppConstants.Typography.sizeCategory, textColor: .appTitle))
                Text("В этой категории нет карточек")
                    .modifier(TextModifier(fontSize: AppConstants.Typography.sizeCategory, textColor: .appWithouAccent))
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
        } else {
            FeaturedGridLayout(spacing: 16) {
                ForEach(items.enumerated(), id: \.element.id) { idx, item in
                    let style: SleepCardStyle = FeaturedGridLayout.isFullWidth(
                        index: idx, count: items.count
                    ) ? .bigger : .small

                    SleepCardView(item: item, style: style)
                }
            }
            .padding(AppConstants.Layout.offsetPage)
        }
    }
}
