//
//  TaskSpecs.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import Foundation
import Alamofire

enum TaskSpecs {
    case startTask
}

extension TaskSpecs: NetworkProviderSpecs {
    
    var path: String {
        "start/compress"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .startTask:
            return [
                "public_key": Credentials.shared.publicKey,
                "token": Credentials.shared.token
            ]
        }
    }
    
    var showDebugInfo: Bool {
        true
    }
    
}
