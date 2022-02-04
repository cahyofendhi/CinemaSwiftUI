//
//  MockMovieRepo.swift
//  Tests iOS
//
//  Created by Dot Indonesia on 03/02/22.
//

import XCTest
@testable import CinemaSwiftUI

class MockMovieRepo: MovieProtocol {
    
    let mockMoviesData: MovieResponse?
    let mockMovieData: Movie?
    let mockPeopleData: PeopleResponse?
    let mockSimiliarData: SimilarResponse?
    
    init() {
        let json = SampleResponse.moviesList().data(using: .utf8)!
        let movies = try! JSONDecoder().decode(MovieResponse.self, from: json)
        self.mockMoviesData = movies
        self.mockMovieData = movies.results?.first
        
        let peopleJson = SampleResponse.peopleList().data(using: .utf8)!
        mockPeopleData = try! JSONDecoder().decode(PeopleResponse.self, from: peopleJson)
        
        let similiarJson = SampleResponse.similiarMovies().data(using: .utf8)!
        mockSimiliarData = try! JSONDecoder().decode(SimilarResponse.self, from: similiarJson)
    }
    
    func getSearchMovieList(group: GroupType, keyword: String, page: Int, completion: @escaping (ApiResult<MovieResponse, ErrorModel>) -> ()) {
        completion(.success(mockMoviesData!))
    }
    
    func getMovieList(category: CategoryType, page: Int, completion: @escaping (ApiResult<MovieResponse, ErrorModel>) -> ()) {
        completion(.success(mockMoviesData!))
    }
    
    func getTVMovieList(category: CategoryType, page: Int, completion: @escaping (ApiResult<MovieResponse, ErrorModel>) -> ()) {
        completion(.success(mockMoviesData!))
    }
    
    func getDetailMovie(id: Int, completion: @escaping (ApiResult<Movie, ErrorModel>) -> ()) {
        completion(.success(mockMovieData!))
    }
    
    func getMovieCrew(id: Int, completion: @escaping (ApiResult<PeopleResponse, ErrorModel>) -> ()) {
        completion(.success(mockPeopleData!))
    }
    
    func getMovieSimiliar(id: Int, completion: @escaping (ApiResult<SimilarResponse, ErrorModel>) -> ()) {
        completion(.success(mockSimiliarData!))
    }
    


}
