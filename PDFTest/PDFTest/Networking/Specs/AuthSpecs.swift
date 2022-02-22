//
//  AuthSpecs.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation
import Alamofire

enum AuthSpecs {
    case getToken
}

extension AuthSpecs: NetworkProviderSpecs {
    
    var path: String {
        "auth"
    }
    
    var method: HTTPMethod {
        .post
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getToken:
            return ["public_key": Credentials.shared.publicKey]
        }
    }
    
    var showDebugInfo: Bool {
        true
    }
    
    var parameterEncoding: ParameterEncoding {
        JSONEncoding.default
    }
    
}
