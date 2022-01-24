//
//  CustomeNavigation.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 29/11/21.
//

import SwiftUI


struct CustomNavigationStyle: ViewModifier {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @ViewBuilder
    func body(content: Content) -> some View {
        if horizontalSizeClass == .compact {
            content.navigationViewStyle(StackNavigationViewStyle())
        } else {
            content.navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}
