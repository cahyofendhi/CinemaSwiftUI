//
//  RectShimmerView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/01/22.
//

import Foundation
import SwiftUI

struct HListShimmerView: View {
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Title Movie")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 16)
                .padding(.top, 16)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 16, content: {
                    
                    Rectangle().fill(Color.white).frame(width: 0)

                    ForEach([1, 2, 3, 4, 5, 6, 7], id: \.self) { it in
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            Rectangle()
                                .foregroundColor(.gray)
                                .accentColor(.gray)
                                .background(Color.gray)
                                .frame(width: UIScreen.width / 3, height: (UIScreen.width / 3 - 10) * 4/3)
                                .cornerRadius(10)
                                
                            
                            Text("abcdefghij")
                                .bold()
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                                .lineLimit(2)
                            
                            Text("abcdefghij")
                                .bold()
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                                .lineLimit(2)
                            
                            Spacer()
                            
                        })
                        .frame(width: UIScreen.width / 3)
                        
                        
                    }
                    Rectangle().fill(Color.white).frame(width: 0)
                })
            })
        })
        .redacted(reason: .placeholder)
        .shimmering()
        
    }
}

