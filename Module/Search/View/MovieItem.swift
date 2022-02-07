//
//  MovieItem.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 25/01/22.
//

import SwiftUI

struct MovieItem: View {
    
    var movie: Movie
    
    var body: some View {
        
        NavigationLink(
            destination: DetailMovieView(movie: movie)) {
                HStack(alignment: .top, spacing: 16, content: {
                    
                    ImageView(url: movie.getImagePoster())
                        .aspectRatio(3/4, contentMode: .fill)
                        .frame(width: (UIScreen.width / (ScreenUtil.isIphone() ? 4 : 6)))
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text(movie.title!)
                            .font(.system(size: 12))
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("\(String(format: "%.1f", movie.voteAverage ?? 0))")
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(3)
                        
                        Text(movie.genreList())
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                        Text(DateFormat.convertStringDate(movie.releaseDate ?? ""))
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    })
                    
                    Spacer()
                    
                    
                })
        }
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(movie: Movie())
    }
}
