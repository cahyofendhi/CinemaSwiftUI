//
//  PopularMovie.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/11/21.
//

import SwiftUI

struct PopularMovieView: View {
    
    var data = [1, 2, 3, 4, 5, 6, 7, 8]
    
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

                    ForEach(data, id: \.self) { it in
                        
                        NavigationLink(destination: DetailMovieView(tabBar: self.tabBar)) {
                            VStack(alignment: .leading, spacing: 5, content: {
                                ImageView(withURL: "https://talenthouse-res.cloudinary.com/image/upload/c_limit,f_auto,fl_progressive,h_1280,w_1280/v1613767843/user-1106846/profile/fojndsvlvdjtayy11ucr.jpg",
                                    mode: .fill)
                                    .frame(maxWidth: .infinity)
                                    .aspectRatio(1, contentMode: .fill)
                                    .cornerRadius(10)
                                
                                Text("Grozie Lipeli")
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                
                                Text("12/10/2021")
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
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
        PopularMovieView()
    }
}
