//
//  EndpointItem.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 17/01/22.
//

import Foundation
import Alamofire

enum EndpointItem {
    
    case movieList(_ category: String)
    case searchMovie(group: String)
    case movieDetail(id: Int)
    case movieMedia(id: Int)
    case movieSimiliar(id: Int)
    case tvList(_ category: String)
    case tvDetail(id: Int)
    
}

// MARK: - Extensions
// MARK: - EndPointType
extension EndpointItem: EndPointType {
    
    
    var baseURL: String {
        return Constant.baseUrl
    }
    
    var version: String {
        return "3/"
    }
    
    var path: String {
        switch self {
        case .movieList(let category):
            return "movie/\(category)"
        case .searchMovie(let group):
            return "search/\(group)"
        case .movieDetail(let id):
            return "movie/\(id)"
        case .movieMedia(let id):
            return "movie/\(id)/credits"
        case .movieSimiliar(let id):
            return "movie/\(id)/similar"
        case .tvList(let category):
            return "tv/\(category)"
        case .tvDetail(let id):
            return "tv/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.version + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
}
