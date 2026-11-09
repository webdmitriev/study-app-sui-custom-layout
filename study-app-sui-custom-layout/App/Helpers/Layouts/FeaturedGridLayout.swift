//
//  FeaturedGridLayout.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import SwiftUI

struct FeaturedGridLayout: Layout {
    var spacing: CGFloat = 16

    // MARK: - Правила
    private func isFullWidth(index: Int, count: Int) -> Bool {
        if index == 0 { return true }
        if count % 2 == 0 && index == count - 1 { return true }
        return false
    }

    // MARK: - Layout
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let width = proposal.width, width.isFinite, width > 0 else { return .zero }

        let columnWidth = (width - spacing) / 2
        var height: CGFloat = 0
        var index = 0
        let count = subviews.count

        while index < count {
            let rowHeight: CGFloat

            if isFullWidth(index: index, count: count) {
                rowHeight = subviews[index]
                    .sizeThatFits(ProposedViewSize(width: width, height: nil))
                    .height
                index += 1
            } else {
                let h1 = subviews[index]
                    .sizeThatFits(ProposedViewSize(width: columnWidth, height: nil)).height
                let h2 = subviews[index + 1]
                    .sizeThatFits(ProposedViewSize(width: columnWidth, height: nil)).height
                rowHeight = max(h1, h2)
                index += 2
            }

            if index > 0 { height += spacing }
            height += rowHeight
        }

        return CGSize(width: width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let width = bounds.width
        let columnWidth = (width - spacing) / 2
        var y = bounds.minY
        var index = 0
        let count = subviews.count

        while index < count {
            if isFullWidth(index: index, count: count) {
                let subview = subviews[index]
                let h = subview
                    .sizeThatFits(ProposedViewSize(width: width, height: nil))
                    .height
                subview.place(at: CGPoint(x: bounds.minX, y: y),
                              proposal: ProposedViewSize(width: width, height: h))
                y += h + spacing
                index += 1
            } else {
                let h1 = subviews[index]
                    .sizeThatFits(ProposedViewSize(width: columnWidth, height: nil)).height
                let h2 = subviews[index + 1]
                    .sizeThatFits(ProposedViewSize(width: columnWidth, height: nil)).height
                let rowHeight = max(h1, h2)

                for column in 0..<2 {
                    let x = bounds.minX + CGFloat(column) * (columnWidth + spacing)
                    subviews[index + column]
                        .place(at: CGPoint(x: x, y: y),
                               proposal: ProposedViewSize(width: columnWidth, height: rowHeight))
                }
                y += rowHeight + spacing
                index += 2
            }
        }
    }
}
