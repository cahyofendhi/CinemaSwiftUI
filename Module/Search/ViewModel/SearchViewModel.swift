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
    @Published var movies: [Movie]?
    private var group: GroupType
    
    @Published var keyword = ""
    private var subscriptions = Set<AnyCancellable>()

    
    private let repository: MovieRepository
    
    init(_ group: GroupType = .movie) {
        self.group = group
        self.repository = MovieRepository()
        
        $keyword
        .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
        .sink(receiveValue: { t in
            self.getSearchMovie(keyword: t.isEmpty ? "a" : t)
        } )
        .store(in: &subscriptions)
    }
    
    func getSearchMovie(keyword: String) {
        getMovie(keyword)
    }
    
    private func getMovie(_ keyword: String = "a") {
        loadingMovie = true
        self.repository.getSearchMovieList(group: self.group, keyword: keyword) { (result: ApiResult<MovieResponse, ErrorModel>) in
            switch result {
            case .success(let data):
                self.loadingMovie = false
                if let models = data.results {
                    self.movies = models
                }
                break
            case .failure(let error):
                print("Error : \(error)")
                self.loadingMovie = false
                break
            }
        }
    }
}
