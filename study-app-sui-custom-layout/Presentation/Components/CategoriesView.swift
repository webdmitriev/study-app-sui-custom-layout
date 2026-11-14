//
//  CategoriesView.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 14.11.2026.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [SleepCategory]
    var currentCategory: SleepCategory
    
    var changeCat: (_ cat: SleepCategory) -> ()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 18) {
                ForEach(categories, id: \.self) { cat in
                    Button {
                        changeCat(cat)
                    } label: {
                        VStack(spacing: 10) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 64, height: 64)
                                    .foregroundStyle(currentCategory == cat ? .appAccent : .appWithouAccent)
                                    .clipShape(RoundedRectangle(cornerRadius: AppConstants.Layout.brsCategories))
                                
                                Image(cat.iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                            }

                            Text(cat.rawValue.capitalized)
                                .modifier(TextModifier(fontSize: AppConstants.Typography.sizeCategory, textColor: .appTitle))
                        }
                    }
                }
            }
            .padding(.horizontal, AppConstants.Layout.offsetPage)
        }
    }
}
