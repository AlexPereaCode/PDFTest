//
//  DownloadSpecs.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation
import Alamofire

enum DownloadSpecs {
    case download(process: ProcessEntity)
}

extension DownloadSpecs: NetworkProviderSpecs {
    
    var path: String {
        ""
    }
    
    var baseURLString: String {
        switch self {
        case .download(let process):
            return "https://\(process.server)/v1/download/\(process.task)"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: HTTPHeaders? {
        return [
            .authorization(bearerToken: Credentials.shared.token),
        ]
    }
    
    var showDebugInfo: Bool {
        true
    }
    
}
