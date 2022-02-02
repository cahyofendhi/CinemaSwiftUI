//
//  UpcomingView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

struct UpcomingView: View {
    
    let movies: [Movie]
    
    var body: some View {
        
        if (movies.isEmpty) {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 16, content: {
                Text("Upcoming Movie")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .padding(.top, 16)
                
                ACarousel(movies,
                          id: \.self,
                          spacing: 16,
                          headspace: 10,
                          sidesScaling: 0.85,
                          isWrap: false) { item in
                    
                    NavigationLink(destination: DetailMovieView(movie: item)) {
                    
                        ZStack() {
                            ImageView(url: item.getImagePoster())
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 150, alignment: .center)
                            
                            VStack {
                                Spacer()
                                HStack {
                                    VStack(alignment: .leading, spacing: 5){
                                        Text(item.title!)
                                            .font(.system(size: 14))
                                            .foregroundColor(.white)
                                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                        Text(item.overview!)
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                    }
                                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
                                    Spacer()
                                }.background(
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [.gray.opacity(0.5), .black.opacity(0.5)]),
                                        startPoint: .top, endPoint: .bottom)
                                )
                            }
                            .padding(.bottom, 0)
                        }
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .topLeading
                        )
                        .shadow(radius: 10)
                        .cornerRadius(10)
                        
                    }
                }
                .frame(height: ScreenUtil.isIphone() ? 150 : 300)
                
            })
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView(movies: [])
    }
}
