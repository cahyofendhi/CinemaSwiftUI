//
//  TagView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 01/12/21.
//

import SwiftUI

struct TagView: View {
    
    var data: [String] = [String]()
    var spacing: CGFloat = 16
    var padding: CGFloat = 5
    var radius: CGFloat = 10
    var lineWidth: CGFloat = 1
    var textColor: Color = Color.black
    var backgroundColor: Color = Color.gray
    var borderColor: Color = Color.gray
    
    var body: some View {
        
        FlexibleView(
            data: data,
            spacing: spacing,
            alignment: .leading
          ) { item in
            Text(verbatim: item)
                .font(.system(size: 12))
                .foregroundColor(textColor)
                .padding(padding)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: radius)
                        .stroke(borderColor, lineWidth: lineWidth)
                )
                .cornerRadius(radius)
                
          }
        
    }
    
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
