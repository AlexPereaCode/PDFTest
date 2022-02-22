//
//  AuthInterceptor.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation
import Alamofire

enum InternetError: Error {
    case noConnection
}

final class AuthInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Swift.Result<URLRequest, Error>) -> Void) {
        if NetworkReachabilityManager.default?.isReachable == false {
            completion(.failure(InternetError.noConnection))
            return
        }
        completion(.success(urlRequest))
    }
}
