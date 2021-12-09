//
//  SimiliarMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 02/12/21.
//

import SwiftUI

struct SimiliarMovieView: View {
    
    var data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    
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
                    
                    ForEach(data, id: \.self) { item in
                        
                        NavigationLink(destination: DetailMovieView(tabBar: self.tabBar)) {
                        
                            VStack(alignment: .center) {
                            
                                ImageView(withURL: "https://talenthouse-res.cloudinary.com/image/upload/c_limit,f_auto,fl_progressive,h_1280,w_1280/v1613767843/user-1106846/profile/fojndsvlvdjtayy11ucr.jpg",
                                    mode: .fill)
                                    .aspectRatio(1, contentMode: .fill)
                                    .cornerRadius(10)
                                
                                Text("Grozie Lipeli")
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
        
    }
    
}

struct SimiliarMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SimiliarMovieView()
    }
}
