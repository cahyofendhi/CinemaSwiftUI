//
//  ApiCallManager.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 11/01/22.
//

import Foundation
import Alamofire


class APIManager {

    
    private let sessionManager: Session
        
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: Session())
        
        return apiManager
    }()
    
   
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    func call<T>(type: EndPointType, params: Parameters? = nil, completion: @escaping(ApiResult<T, ErrorModel>)->()) where T: Codable {
        
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers)
            .validate(statusCode: 200..<600)
            .response { response in
                
                
                print("url \(String(describing: response.request))")
                
                guard let statusCode = response.response?.statusCode else {
                    completion(.failure(ErrorModel.defaultError()))
                    return
                }
                guard let responseData = response.data else { return }

                if 100..<300 ~= statusCode {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: responseData)
                        completion(.success(model))
                    } catch {
                        completion(.failure(ErrorModel.defaultError()))
                    }
                } else {
                    let message = response.error?.errorDescription ?? "Error Undefined"
                    completion(.failure(ErrorModel(message: message, code: statusCode)))
                }
            }
    }
 
    
}
