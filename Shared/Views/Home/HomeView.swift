//
//  HomeView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    
    @State private var tabBar: UITabBar? = nil
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            
            NoSepratorList {
                UpcomingView(movies: viewModel.upcomingMovies ?? [])
                    .hideRowSeparator()

                PopularMovieView(movies: viewModel.popularMovies ?? [], tabBar: self.tabBar)
                    .hideRowSeparator()
                    .padding(.top, 16)
                
                TopRateMovieView(movies: viewModel.topMovies ?? [])
                    .hideRowSeparator()
                    .padding(.top, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Movie")
                    }
                    .foregroundColor(.black)
                }
            })
            .onAppear {
                self.tabBar?.isHidden = false
            }
            
        }
        .background(TabBarAccessor { tabbar in
            self.tabBar = tabbar
        })

        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
