//
//  NetworkProviderSpecs.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation
import Alamofire

public protocol NetworkProviderSpecs {
    var baseURLString: String { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: [String: Any]? { get }
    var parameterEncoding: ParameterEncoding { get }
    var allowOffline: Bool { get }
    var showDebugInfo: Bool { get }
}

extension NetworkProviderSpecs {
    
    var baseURLString: String {
        return Credentials.shared.apiBaseURL
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        URLEncoding.default
    }
    
    var allowOffline: Bool {
        return false
    }
    
    var showDebugInfo: Bool {
        return true
    }
    
    var url: URL {
        guard let url = URL(string: "\(baseURLString)\(path)") else { fatalError("URL malformed") }
        return url
    }
}
