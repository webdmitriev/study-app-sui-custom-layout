//
//  TextModifier.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import SwiftUI

struct TextModifier: ViewModifier {
    var isFrameFull: Bool = true
    var fontSize: CGFloat = 16
    var fontWeight: Font.Weight = .regular
    var textColor: Color = .black
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: isFrameFull ? .infinity : .none, alignment: .leading)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundStyle(textColor)
    }
}
