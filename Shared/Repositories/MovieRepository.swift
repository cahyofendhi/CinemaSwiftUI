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
    
}
