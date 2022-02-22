//
//  UploadSpecs.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import Foundation
import Alamofire

enum UploadSpecs {
    case upload(server: String, task: String)
}

extension UploadSpecs: NetworkProviderSpecs {
    
    var path: String {
        ""
    }
    
    var baseURLString: String {
        switch self {
        case .upload(let server, _):
            return "https://\(server)/v1/upload"
        }
    }
    
    var method: HTTPMethod {
        .post
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .upload(_, let task):
            return [
                "public_key": Credentials.shared.publicKey,
                "task": task
            ]
        }
    }
    
    var headers: HTTPHeaders? {
        return [.authorization(bearerToken: Credentials.shared.token)]
    }
    
    var showDebugInfo: Bool {
        true
    }
    
    var parameterEncoding: ParameterEncoding {
        JSONEncoding.default
    }
    
}
