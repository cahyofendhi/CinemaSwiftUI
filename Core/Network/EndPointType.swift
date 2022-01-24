//
//  EndPointType.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 17/01/22.
//

import Foundation
import Alamofire

protocol EndPointType {
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
    
}
