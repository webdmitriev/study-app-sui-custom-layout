//
//  HomeHeaderView.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 11.11.2026.
//

import SwiftUI

struct HomeHeaderView: View {
    var title: String
    var descr: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Spacer(minLength: 18)

            Text(title)
                .modifier(TextModifier(fontSize: AppConstants.Typography.header, fontWeight: .bold, textColor: .appTitle))
            
            Text(descr)
                .modifier(TextModifier(textColor: .appText))
                .lineSpacing(2)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, AppConstants.Layout.offsetPage)
    }
}
