//
//  TVTopRateView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 25/11/21.
//

import SwiftUI

struct TVTopRateView: View {
    
    
    let movies: [Movie]
    
    let title: String?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20, content: {
            Text(self.title ?? "Title")
                .font(.system(size: 14))
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 16)
                .padding(.top, 16)
            
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(alignment: .top, spacing: 16, content: {
                        Rectangle().fill(Color.white).frame(width: 0)
                        ForEach(movies, id: \.self) { it in
                            VStack(alignment: .leading, spacing: 5, content: {
                                ImageView(url: it.getImagePoster())
                                    .frame(width: UIScreen.width / (ScreenUtil.isIphone() ? 4 : 6),
                                           height: (UIScreen.width / (ScreenUtil.isIphone() ? 4 : 6)) * 4/3, alignment: .center)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                                
                                Text(it.name ?? "")
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                
                                Text(it.genreList())
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                
                                Spacer()
                                
                            })
                            .frame(width: UIScreen.width / (ScreenUtil.isIphone() ? 4 : 6))
                        }
                        Rectangle().fill(Color.white).frame(width: 0)
                    })
                })
        })
        
    }
    
}

struct TVTopRateView_Previews: PreviewProvider {
    static var previews: some View {
        TVTopRateView(movies: [], title: "Movie")
    }
}
