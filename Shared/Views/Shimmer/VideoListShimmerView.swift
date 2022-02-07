//
//  VideoListShimmerView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/01/22.
//

import Foundation

import SwiftUI

struct VideoListShimmerView: View {
    
    var body: some View {
        
        Text("Title Movie")
            .font(.system(size: 14))
            .bold()
            .foregroundColor(.black)
            .padding(.leading, 16)
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            HStack(alignment: .top, spacing: 16, content: {
                
                Rectangle().fill(Color.white).frame(width: 0)
                
                ForEach([0, 1, 2, 3, 4, 5], id: \.self) { it in
                    
                    ZStack {
        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(contentMode: .fill)
                            
                        Image("ic_play")
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                        
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.1))
                        
                        
                    }
                    .frame(width: UIScreen.width / (ScreenUtil.isIphone() ? 3 : 5),
                           height: (UIScreen.width / (ScreenUtil.isIphone() ? 3 : 5)) / 2)
                    .cornerRadius(10)
                    
                }
                
                Rectangle().fill(Color.white).frame(width: 0)
                
            })
            .frame(maxWidth: .infinity)
        })
        .redacted(reason: .placeholder)
        .shimmering()
        
    }
    
}
