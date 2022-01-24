//
//  ErrorModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 11/01/22.
//

import Foundation

enum ApiResult<Value, Error>{
    case success(Value)
    case failure(Error)
    
    init(value: Value){
        self = .success(value)
    }
    
    init(error: Error){
        self = .failure(error)
    }
}

class ApiResponse<T>: Decodable where T: Codable {
    
    let message: String
    let data: T
    
    init(message: String, data: T) {
        self.message = message
        self.data = data
    }
    
}

class ErrorModel: Decodable {
    
    let message: String
    let code: Int
    
    init(message: String, code: Int) {
        self.message = message
        self.code = code
    }
    
    static func defaultError() -> ErrorModel {
        return ErrorModel(message: "Error Occured", code: 0)
    }
    
}
