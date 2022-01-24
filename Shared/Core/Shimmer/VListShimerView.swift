//
//  RectShimmerView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/01/22.
//

import Foundation
import SwiftUI

struct VListShimmerView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Top Movie")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 16)
            
            VStack(alignment: .leading) {
                
                ForEach([0, 1, 2, 3, 4, 5], id: \.self) { it in
                    
                    HStack(alignment: .top, spacing: 16, content: {
                        
                        
                            Rectangle()
                                .aspectRatio(3/4, contentMode: .fill)
                                .frame(width: (UIScreen.width / (ScreenUtil.isIphone() ? 4 : 6)))
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                Text("asdadadsadadad")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Text("asdadadsadadad")
                                    .font(.system(size: 10))
                                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(3)
                                
                                Text("asdadadsadadad")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                Text("12/12/2022")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            })
                        
                        Spacer()
                            
                    })
                    .frame(width: UIScreen.width)
                    
                }
                .padding(.leading, 16)
                
            }
            
        })
        .redacted(reason: .placeholder)
        .shimmering()
        
    }
    
}
