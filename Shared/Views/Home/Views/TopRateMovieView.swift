//
//  TopRateMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/11/21.
//

import SwiftUI

struct TopRateMovieView: View {
    
    var data = [1, 2, 3, 4, 5, 6, 7, 8]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Top Movie")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 16)
                .padding(.top, 16)
            
            VStack {
                
                ForEach(data, id: \.self) { it in
                    
                    HStack(alignment: .top, spacing: 16, content: {
                        
                        ImageView(withURL: "https://talenthouse-res.cloudinary.com/image/upload/c_limit,f_auto,fl_progressive,h_1280,w_1280/v1613767843/user-1106846/profile/fojndsvlvdjtayy11ucr.jpg",
                            mode: .fill)
                            .aspectRatio(3/4, contentMode: .fill)
                            .frame(width: (UIScreen.width / 4))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text("Gracia")
                                .font(.system(size: 12))
                                .bold()
                                .foregroundColor(.black)
                            
                            Text("8,5")
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(3)
                            
                            Text("Action, Comedy, Drama")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                            
                            Text("12/12/2021")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        })
                        
                        Spacer()
                        
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
        TopRateMovieView()
    }
}
