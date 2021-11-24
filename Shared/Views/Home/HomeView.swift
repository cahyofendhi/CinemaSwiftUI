//
//  HomeView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

struct HomeView: View {
    
    var datas = [1, 2, 3, 4, 5, 6, 7]
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                UpcomingView()
                    .hideRowSeparator()
                PopularMovieView()
                    .hideRowSeparator()
                    .padding(.top, 16)
                TopRateMovieView()
                    .hideRowSeparator()
                    .padding(.top, 16)
            }
            .listRowBackground(Color.white)
            .listRowInsets(.none)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Home")
                    }
                    .foregroundColor(.black)
                }
            })
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
