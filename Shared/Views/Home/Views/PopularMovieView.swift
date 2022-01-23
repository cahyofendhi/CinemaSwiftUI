//
//  PopularMovie.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/11/21.
//

import SwiftUI

struct PopularMovieView: View {
    
    let movies: [Movie]
    
    @State var tabBar: UITabBar! = nil
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Popular Movie")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 16)
                .padding(.top, 16)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 16, content: {
                    
                    Rectangle().fill(Color.white).frame(width: 0)

                    ForEach(movies, id: \.self) { it in
                        
                        NavigationLink(destination: DetailMovieView(tabBar: self.tabBar, movie: it)) {
                            VStack(alignment: .leading, spacing: 5, content: {
                                ImageView(url: it.getImagePoster())
                                    .frame(width: UIScreen.width / 3, height: (UIScreen.width / 3 - 10) * 4/3)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                                
                                Text(it.title ?? "-")
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                
                                Text(DateFormat.convertStringDate(it.releaseDate ?? ""))
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                
                                Spacer()
                                
                            })
                            .frame(width: UIScreen.width / 3)
                        }
                        
                    }
                    Rectangle().fill(Color.white).frame(width: 0)
                })
            })
        })
        
    }
    
}

struct PopularMovie_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieView(movies: [])
    }
}
