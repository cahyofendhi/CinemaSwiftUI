//
//  TopRateMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/11/21.
//

import SwiftUI

struct TopRateMovieView: View {
    
    let movies: [Movie]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Top Movie")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 16)
                .padding(.top, 16)
            
            VStack {
                
                ForEach(movies, id: \.self) { it in
                    
                    HStack(alignment: .top, spacing: 16, content: {
                        
                        NavigationLink(destination: DetailMovieView(movie: it)) {
                        
                            ImageView(url: it.getImagePoster())
                                .aspectRatio(3/4, contentMode: .fill)
                                .frame(width: (UIScreen.width / (ScreenUtil.isIphone() ? 4 : 6)))
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                Text(it.title!)
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Text("\(String(format: "%.1f", it.voteAverage ?? 0))")
                                    .font(.system(size: 10))
                                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(3)
                                
                                Text(it.genreList())
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                Text(DateFormat.convertStringDate(it.releaseDate ?? ""))
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            })
                            
                            Spacer()
                            
                        }
                        
                    })
                    .frame(width: UIScreen.width)
                    
                }
                
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            
            
        })
        
    }
    
}

struct TopRateMovieView_Previews: PreviewProvider {
    static var previews: some View {
        TopRateMovieView(movies: [])
    }
}
