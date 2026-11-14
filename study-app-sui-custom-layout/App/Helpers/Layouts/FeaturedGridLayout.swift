//
//  FeaturedGridLayout.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 09.11.2026.
//

import SwiftUI

struct FeaturedGridLayout: Layout {
    var spacing: CGFloat = 16
    var columns: Int = 2

    static func isFullWidth(index: Int, count: Int, columns: Int = 2) -> Bool {
        guard index == 0 || index == count - 1 else { return false }
        if index == 0 { return true }
        // последний большой, если после первого элемента остаётся неполный ряд
        return (count - 1) % columns != 0
    }

    private func spansFullWidth(index: Int, count: Int) -> Bool {
        Self.isFullWidth(index: index, count: count, columns: columns)
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let width = proposal.width, width.isFinite, width > 0 else { return .zero }

        let columnWidth = (width - spacing * CGFloat(columns - 1)) / CGFloat(columns)
        var height: CGFloat = 0
        var index = 0
        let count = subviews.count
        let lastIsFull = spansFullWidth(index: count - 1, count: count)

        while index < count {
            let rowHeight: CGFloat

            if spansFullWidth(index: index, count: count) {
                rowHeight = subviews[index]
                    .sizeThatFits(ProposedViewSize(width: width, height: nil)).height
                index += 1
            } else {
                let remaining = count - index
                let take = min(columns, lastIsFull ? remaining - 1 : remaining)
                let h = (0..<take).map {
                    subviews[index + $0]
                        .sizeThatFits(ProposedViewSize(width: columnWidth, height: nil)).height
                }.max() ?? 0
                rowHeight = h
                index += take
            }

            if index < count { height += spacing }
            height += rowHeight
        }

        return CGSize(width: width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let width = bounds.width
        let columnWidth = (width - spacing * CGFloat(columns - 1)) / CGFloat(columns)
        var y = bounds.minY
        var index = 0
        let count = subviews.count
        let lastIsFull = spansFullWidth(index: count - 1, count: count)

        while index < count {
            if spansFullWidth(index: index, count: count) {
                let subview = subviews[index]
                let h = subview
                    .sizeThatFits(ProposedViewSize(width: width, height: nil)).height
                subview.place(at: CGPoint(x: bounds.minX, y: y),
                              proposal: ProposedViewSize(width: width, height: h))
                y += h
                index += 1
            } else {
                let remaining = count - index
                let take = min(columns, lastIsFull ? remaining - 1 : remaining)
                let rowHeight = (0..<take).map {
                    subviews[index + $0]
                        .sizeThatFits(ProposedViewSize(width: columnWidth, height: nil)).height
                }.max() ?? 0

                for column in 0..<take {
                    let x = bounds.minX + CGFloat(column) * (columnWidth + spacing)
                    subviews[index + column]
                        .place(at: CGPoint(x: x, y: y),
                               proposal: ProposedViewSize(width: columnWidth, height: rowHeight))
                }
                y += rowHeight
                index += take
            }

            if index < count { y += spacing }
        }
    }
}
