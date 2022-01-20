//
//  HomeViewModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 09/12/21.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var loadingUpcoming: Bool?
    @Published var loadingPopular: Bool?
    @Published var loadingTop: Bool?
    @Published var upcomingMovies: [Movie]?
    @Published var popularMovies: [Movie]?
    @Published var topMovies: [Movie]?
    
    private let repository: MovieRepository
    
    init() {
        self.repository = MovieRepository()
        getMovieList()
    }
    
    private func getMovieList() {
        self.getMovie(.upcoming)
        self.getMovie(.popular)
        self.getMovie(.toprate)
    }
    
    private func getMovie(_ category: CategoryType) {
        loadingUpcoming = true
        loadingPopular = true
        loadingTop = true
        self.repository.getMovieList(category: category) { (result: ApiResult<MovieResponse, ErrorModel>) in
            switch result {
            case .success(let data):
                if let models = data.results {
                    switch category {
                    case .popular:
                        self.loadingPopular = false
                        self.popularMovies = models
                        break
                    case .upcoming:
                        self.loadingUpcoming = false
                        self.upcomingMovies = models
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
                    self.loadingUpcoming = false
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
