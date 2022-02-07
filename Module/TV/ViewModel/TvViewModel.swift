//
//  TvViewModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 19/01/22.
//

import Foundation


class TvViewModel: ObservableObject {
    
    @Published var loadingOnAir: Bool?
    @Published var loadingPopular: Bool?
    @Published var loadingTop: Bool?
    @Published var onAirMovies: [Movie]?
    @Published var popularMovies: [Movie]?
    @Published var topMovies: [Movie]?
    
    private let repository: MovieProtocol
    
    init(repository: MovieProtocol = MovieRepository()) {
        self.repository = repository
        getMovieList()
    }
    
    private func getMovieList() {
        self.getMovie(.onAir)
        self.getMovie(.popular)
        self.getMovie(.toprate)
    }
    
    private func getMovie(_ category: CategoryType) {
        loadingOnAir = true
        loadingPopular = true
        loadingTop = true
        self.repository.getTVMovieList(category: category, page: 1) { (result: ApiResult<MovieResponse, ErrorModel>) in
            switch result {
            case .success(let data):
                if let models = data.results {
                    switch category {
                    case .popular:
                        self.loadingPopular = false
                        self.popularMovies = models
                        break
                    case .onAir:
                        self.loadingOnAir = false
                        self.onAirMovies = models
                        break
                    case .toprate:
                        self.loadingTop = false
                        self.topMovies = models
                        break
                    default:
                        break
                    }
                }
                break
            case .failure(_):
                switch category {
                case .popular:
                    self.loadingPopular = false
                    break
                case .upcoming:
                    self.loadingOnAir = false
                    break
                case .toprate:
                    self.loadingTop = false
                    break
                default:
                    break
                }
                break
            }
        }
    }
}
