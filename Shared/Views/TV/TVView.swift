//
//  TVView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 25/11/21.
//

import SwiftUI

struct TVView: View {
    
    @State private var tabBar: UITabBar? = nil
    
    @ObservedObject private var viewModel = TvViewModel()
    
    var body: some View {
        
        NavigationView {
            
            NoSepratorList {
                
                HStack {
                    Text("TV Movie")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Click")
                    }, label: {
                        Image("ic_search")
                    })
                    .padding(.trailing, 16)
                    
                    
                }
                .hideRowSeparator()
                
                if (viewModel.loadingOnAir ?? true) {
                    VideoListShimmerView()
                } else {
                    TVVideoView(movies: viewModel.onAirMovies ?? [], tabBar: self.tabBar)
                    .hideRowSeparator()
                }
                
                if (viewModel.loadingPopular ?? true) {
                    HListShimmerView()
                } else {
                    TVTopRateView(movies: viewModel.popularMovies ?? [], title: "Popular", tabBar: self.tabBar)
                        .hideRowSeparator()
                }
                
                if (viewModel.loadingTop ?? true) {
                    HListShimmerView()
                } else {
                    TVTopRateView(movies: viewModel.topMovies ?? [], title: "Top Rate", tabBar: self.tabBar)
                        .hideRowSeparator()
                }
                
            }
            .listRowBackground(Color.white)
            .listRowInsets(.none)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .onAppear {
                self.tabBar?.isHidden = false
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(TabBarAccessor { tabbar in
            self.tabBar = tabbar
        })
        
    }
    
}

struct TVView_Previews: PreviewProvider {
    static var previews: some View {
        TVView()
    }
}
