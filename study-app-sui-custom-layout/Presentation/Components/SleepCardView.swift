//
//  SleepCardView.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 14.11.2026.
//

import SwiftUI

enum SleepCardStyle: CaseIterable {
    case bigger, small
}

struct SleepCardView: View {
    var item: SleepCardItem
    var style: SleepCardStyle
    
    var body: some View {
        switch style {
        case .bigger: bigLayout
        case .small: smallLayout
        }
    }
    
    private var bigLayout: some View {
        VStack(spacing: 12) {
            Text(item.title)
                .modifier(TextModifier(fontSize: 36, fontWeight: .black, textColor: .appYellow))
            
            Text(item.descr)
                .modifier(TextModifier(fontSize: 18, fontWeight: .medium, textColor: .white))
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 5)
            
            Button {
                //
            } label: {
                Text("Start".uppercased())
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.appBg)
                    .background(.appButtonBg)
                    .clipShape(RoundedRectangle(cornerRadius: .infinity))
            }
        }
        .padding(.top, 68)
        .padding(.bottom, 20)
        .padding(.horizontal, 34)
        .background {
            Image(item.image)
                .resizable()
                .scaledToFill()
        }
        .clipShape(RoundedRectangle(cornerRadius: AppConstants.Layout.brsCard))
    }
    
    private var smallLayout: some View {
        VStack(spacing: 12) {
            Image(item.image)
                .resizable()
                .frame(height: 124)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: AppConstants.Layout.brsCard))
            
            VStack(spacing: 8) {
                Text(item.title)
                    .modifier(TextModifier(isFrameCenter: false,
                                           fontSize: AppConstants.Typography.titleCard, fontWeight: .bold, textColor: .appTitle))
                
                Text("\(item.timer) - Sleep Music".uppercased())
                    .modifier(TextModifier(isFrameCenter: false, fontSize: 14,
                                           fontWeight: .medium, textColor: .appTitle.opacity(0.8)))
            }
        }
    }
}
