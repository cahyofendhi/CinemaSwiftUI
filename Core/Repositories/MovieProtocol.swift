//
//  MovieProtocol.swift
//  CinemaSwiftUI
//
//  Created by Dot Indonesia on 03/02/22.
//

import Foundation


protocol MovieProtocol {
    func getSearchMovieList(group: GroupType,
                            keyword: String, page: Int,
                            completion: @escaping(ApiResult<MovieResponse, ErrorModel>)->())
    
    func getMovieList(category: CategoryType,
                      page: Int,
                      completion: @escaping(ApiResult<MovieResponse, ErrorModel>)->())
 
    func getTVMovieList(category: CategoryType,
                        page: Int,
                        completion: @escaping(ApiResult<MovieResponse, ErrorModel>)->())
    
    func getDetailMovie(id: Int, completion: @escaping(ApiResult<Movie, ErrorModel>) ->())
    
    func getMovieCrew(id: Int, completion: @escaping(ApiResult<PeopleResponse, ErrorModel>) ->())
    
    func getMovieSimiliar(id: Int, completion: @escaping(ApiResult<SimilarResponse, ErrorModel>) ->())
    
}
