//
//  TVVideoView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 25/11/21.
//

import SwiftUI

struct TVVideoView: View {
    
    let movies: [Movie]
    
    var body: some View {
        
        Text("On Air")
            .font(.system(size: 14))
            .bold()
            .foregroundColor(.black)
            .padding(.leading, 16)
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            HStack(alignment: .top, spacing: 16, content: {
                
                Rectangle().fill(Color.white).frame(width: 0)
                
                ForEach(movies, id: \.self) { it in
                    
                    ZStack {
        
                        ImageView(url: it.getImagePoster())
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
        
    }
    
}

struct TVVideoView_Previews: PreviewProvider {
    static var previews: some View {
        TVVideoView(movies: [])
    }
}
