//
//  SearchViewModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 26/01/22.
//

import Foundation
import Combine


class SearchViewModel: ObservableObject {
    
    @Published var loadingMovie: Bool?
    @Published var movies: [Movie]
    @Published var page: Int = 0
    @Published var totalPages = 1
    @Published var haveMoreData: Bool
    
    private var group: GroupType
    
    @Published var keyword = ""
    private var subscriptions = Set<AnyCancellable>()

    
    private let repository: MovieRepository
    
    init(_ group: GroupType = .movie) {
        self.group = group
        self.repository = MovieRepository()
        self.movies = []
        self.haveMoreData = false
        
        $keyword
        .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
        .sink(receiveValue: { t in
            self.getSearchMovie(keyword: t, page: 1)
        } )
        .store(in: &subscriptions)
    }
    
    func getSearchMovie(keyword: String = "", page: Int = 1) {
        getMovie(keyword, page: page)
    }
    
    private func getMovie(_ keyword: String, page: Int) {
        loadingMovie = true
        self.repository.getSearchMovieList(group: self.group, keyword: keyword, page: page) { (result: ApiResult<MovieResponse, ErrorModel>) in
            switch result {
            case .success(let data):
                self.loadingMovie = false
                if let p = data.page, let totPage = data.totalPages, let models = data.results {
                    if (p == 1) {
                        self.movies = models
                    } else {
                        self.movies.append(contentsOf: models)
                    }
                    self.page = p
                    self.totalPages = totPage
                    self.haveMoreData = p < totPage
                }
                break
            case .failure(let error):
                print("Error : \(error)")
                self.loadingMovie = false
                self.haveMoreData = false
                self.movies = []
                break
            }
        }
    }
}
