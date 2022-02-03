//
//  Text.swift
//  CinemaSwiftUI
//
//  Created by Dot Indonesia on 03/02/22.
//

import Foundation
import SwiftUI

struct TextModifier: ViewModifier {
    
    var size: CGFloat = 14
    var colorName: String = Asset.Colors.appBlack.name
    var fontName: String = FontFamily.Lato.regular.name
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: size))
            .foregroundColor(Color(colorName))
    }
    
}

extension View {
    
    func titleStyle(size: CGFloat = 16, colorName: String = Asset.Colors.appBlack.name) -> some View {
        modifier(TextModifier(size: size, colorName: colorName, fontName: FontFamily.Lato.bold.name))
    }
    
    func standartStyle(size: CGFloat = 14, colorName: String = Asset.Colors.appBlack.name) -> some View {
        modifier(TextModifier(size: size, colorName: colorName))
    }
    
    func descStyle(size: CGFloat = 14, colorName: String = Asset.Colors.appGray.name) -> some View {
        modifier(TextModifier(size: size, colorName: colorName))
    }
    
    func placeholder<Content: View>(
       when shouldShow: Bool,
       alignment: Alignment = .leading,
       @ViewBuilder placeholder: () -> Content) -> some View {

       ZStack(alignment: alignment) {
           placeholder().opacity(shouldShow ? 1 : 0)
           self
       }
    }
    
}
