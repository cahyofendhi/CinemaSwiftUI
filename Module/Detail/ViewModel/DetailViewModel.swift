//
//  DetailViewModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 20/01/22.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var loadingMovie: Bool?
    @Published var movie: Movie?
    @Published var crews: [People]?
    @Published var similiar: [Movie]?
    
    private let repository: MovieRepository
    
    init() {
        self.repository = MovieRepository()
    }
    
    func loadMovie(_ data: Movie?) {
        if let dt = data, let id = data?.id {
            self.movie = dt
            getDetailMovie(id)
            getCrewMovie(id)
            getSimiliarMovie(id)
        }
    }
    
    private func getDetailMovie(_ id: Int) {
        self.repository.getDetailMovie(id: id) { result in
            switch result {
            case .success(let movie):
                self.movie = movie
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func getCrewMovie(_ id: Int) {
        self.repository.getMovieCrew(id: id) { result in
            switch result {
            case .success(let data):
                if let dt = data.crew {
                    print("Crews : \(dt.count)")
                    self.crews = dt
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func getSimiliarMovie(_ id: Int) {
        self.repository.getMovieSimiliar(id: id) { result in
            switch result  {
            case .success(let data):
                if let dt = data.results {
                    print("Similiar : \(dt.count)")
                    self.similiar = dt
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
