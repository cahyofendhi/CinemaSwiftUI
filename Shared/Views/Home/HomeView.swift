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
                
                if (viewModel.loadingUpcoming ?? true) {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .cornerRadius(10, antialiased: true)
                        .frame(width: UIScreen.width - 32,
                               height: ScreenUtil.isIphone() ? 150 : 300,
                               alignment: .center)
                        .padding(.top, 20)
                        .redacted(reason: .placeholder)
                } else {
                    UpcomingView(movies: viewModel.upcomingMovies ?? [],
                                 tabBar: self.tabBar)
                    .hideRowSeparator()
                }
                
                if (viewModel.loadingPopular ?? true) {
                    HListShimmerView()
                } else {
                    PopularMovieView(movies: viewModel.popularMovies ?? [], tabBar: self.tabBar)
                        .hideRowSeparator()
                        .padding(.top, 16)
                }
                
                if (viewModel.loadingTop ?? true) {
                    VListShimmerView()
                } else {
                    TopRateMovieView(movies: viewModel.topMovies ?? [], tabBar: self.tabBar)
                    .hideRowSeparator()
                    .padding(.top, 16)
                }
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
        .navigationViewStyle(StackNavigationViewStyle())
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
