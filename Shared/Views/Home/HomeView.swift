//
//  HomeView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    var datas = [1, 2, 3, 4, 5, 6, 7]
    
    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
        
        NavigationView {
            
            NoSepratorList {
                UpcomingView()
                    .hideRowSeparator()

                PopularMovieView()
                    .hideRowSeparator()
                    .padding(.top, 16)
                
                TopRateMovieView()
                    .hideRowSeparator()
                    .padding(.top, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Home")
                    }
                    .foregroundColor(.black)
                }
            })
            .onAppear {
                self.tabBar.isHidden = false
                UITableView.appearance().showsVerticalScrollIndicator = false
            }
            .onDisappear {
                self.tabBar.isHidden = false
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
