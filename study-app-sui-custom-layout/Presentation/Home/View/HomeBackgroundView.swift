//
//  HomeBackgroundView.swift
//  study-app-sui-custom-layout
//
//  Created by Олег Дмитриев on 12.11.2026.
//

import SwiftUI

struct HomeBackgroundView: View {
    var body: some View {
        Image("bg-cloud-full")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(edges: .top)
    }
}
