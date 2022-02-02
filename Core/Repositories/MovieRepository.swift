//
//  MovieRepository.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 18/01/22.
//

import Foundation

class MovieRepository {
    
    private let service: APIManager
    
    init(service: APIManager = APIManager.shared()) {
        self.service = service
    }
    
    func getSearchMovieList(group: GroupType,
                            keyword: String,
                      page: Int = 1, completion: @escaping(ApiResult<MovieResponse, ErrorModel>)->()) {
        let params: [String: Any] = ["api_key": Constant.apiKey, "page": page, "query" : keyword]
        self.service.call(type: EndpointItem.searchMovie(group: group.rawValue),
                          params: params,
                          completion: completion)
    }
    
    func getMovieList(category: CategoryType,
                      page: Int = 1, completion: @escaping(ApiResult<MovieResponse, ErrorModel>)->()) {
        let params: [String: Any] = ["api_key": Constant.apiKey, "page": page]
        self.service.call(type: EndpointItem.movieList(category.rawValue),
                          params: params,
                          completion: completion)
    }
    
    func getTVMovieList(category: CategoryType,
                      page: Int = 1, completion: @escaping(ApiResult<MovieResponse, ErrorModel>)->()) {
        let params: [String: Any] = ["api_key": Constant.apiKey, "page": page]
        self.service.call(type: EndpointItem.tvList(category.rawValue),
                          params: params,
                          completion: completion)
    }
    
    func getDetailMovie(id: Int, completion: @escaping(ApiResult<Movie, ErrorModel>) ->()) {
        self.service.call(type: EndpointItem.movieDetail(id: id), params: ["api_key": Constant.apiKey], completion: completion)
    }
    
    func getMovieCrew(id: Int, completion: @escaping(ApiResult<PeopleResponse, ErrorModel>) ->()) {
        self.service.call(type: EndpointItem.movieCrew(id: id), params: ["api_key": Constant.apiKey], completion: completion)
    }
    
    func getMovieSimiliar(id: Int, completion: @escaping(ApiResult<SimilarResponse, ErrorModel>) ->()) {
        self.service.call(type: EndpointItem.movieSimiliar(id: id), params: ["api_key": Constant.apiKey], completion: completion)
    }
 
}
