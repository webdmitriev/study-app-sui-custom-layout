//
//  LayoutColumns.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 15.11.2026.
//

import SwiftUI

enum LayoutColumns {

    /// Сколько колонок использовать для данной ширины.
    /// iPhone Fold/Duo: свёрнутый — compact → 2 колонки (старая схема),
    /// развёрнутый — regular → 3 колонки. iPad — тоже 3.
    static func gridColumns(for horizontalSizeClass: UserInterfaceSizeClass?) -> Int {
        switch horizontalSizeClass {
        case .regular: return 3
        default:       return 2
        }
    }
}
