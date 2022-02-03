//
//  SearchMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 25/01/22.
//

import SwiftUI
import UIKit

struct SearchMovieView: View {
    
    @State var isTv: Bool
    @ObservedObject private var viewModel = SearchViewModel()
    
    @State var isLoad = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12, content: {
            SearchBar(text: $viewModel.keyword)
            
            PullAndRefreshScrollView(loading: viewModel.loadingMovie ?? true, isloadMore: viewModel.haveMoreData) {
                self.viewModel.getSearchMovie(keyword: viewModel.keyword, page: 1)
            } onLoad: {
                viewModel.getSearchMovie(keyword: viewModel.keyword, page: viewModel.page + 1)
            } content: {
                if viewModel.loadingMovie ==  true && viewModel.movies.isEmpty {
                    VListShimmerView()
                } else if viewModel.movies.isEmpty {
                    Text("Data Not Found")
                        .frame(width: UIScreen.width, height: UIScreen.height / 1.5, alignment: .center)
                } else {
                    ForEach(viewModel.movies, id: \.self) { dt in
                       MovieItem(movie: dt)
                           .padding(EdgeInsets(top: 6, leading: 16, bottom: 16, trailing: 16))
                           .hideRowSeparator()
                   }
                }
            }
            .padding(.top, -10)
            
        })
        .navigationTitle("Movie")
        .background(TabBarAccessor { tabbar in
            tabbar.isHidden = true
        })
        .onLoad {
            viewModel.getSearchMovie()
        }
    }
}

struct SearchMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieView(isTv: true)
    }
}
