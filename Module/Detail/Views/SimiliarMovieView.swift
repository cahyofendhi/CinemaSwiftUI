//
//  SimiliarMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 02/12/21.
//

import SwiftUI

struct SimiliarMovieView: View {
    
    var movies: [Movie]?
    
    var body: some View {
        
        let width = UIScreen.width / (ScreenUtil.isIphone() ? 5 : 7)
        
        VStack(alignment: .leading) {
            
            Text("Similiar")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
            
            
            LazyVGrid(columns: ScreenUtil.isIphone() ?
                        [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                      alignment: .leading, spacing: 16) {
                
                ForEach(movies ?? [], id: \.self) { it in
                    
                    NavigationLink(destination: DetailMovieView(movie: it)) {
                    
                        VStack(alignment: .center) {
                        
                            ImageView(url: it.getImagePoster())
                                .frame(width: width,
                                       height: width,
                                       alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                            
                            Text(it.title ?? "")
                                .bold()
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                                .lineLimit(2)
                            
                            Spacer()

                        }
                        
                    }
                    
                }
                
            }
            
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        
    }
    
}

struct SimiliarMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SimiliarMovieView()
    }
}
