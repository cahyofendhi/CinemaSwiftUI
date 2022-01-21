//
//  SimiliarMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 02/12/21.
//

import SwiftUI

struct SimiliarMovieView: View {
    
    var movies: [Movie]?
    
    @State var tabBar: UITabBar? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Similiar")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
            
            ScrollView {
            
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], alignment: .leading, spacing: 16) {
                    
                    ForEach(movies ?? [], id: \.self) { it in
                        
                        NavigationLink(destination: DetailMovieView(tabBar: self.tabBar, movie: it)) {
                        
                            VStack(alignment: .center) {
                            
                                ImageView(withURL: it.getImagePoster(),
                                    mode: .fill)
                                    .aspectRatio(1, contentMode: .fill)
                                    .cornerRadius(10)
                                
                                Text(it.title ?? "")
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.black)
                                    .lineLimit(2)

                            }
                            
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
