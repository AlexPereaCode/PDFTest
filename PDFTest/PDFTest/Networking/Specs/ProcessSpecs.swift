//
//  ProcessSpecs.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation
import Alamofire

enum ProcessSpecs {
    case process(process: ProcessRequest)
}

extension ProcessSpecs: NetworkProviderSpecs {
    
    var path: String {
        ""
    }
    
    var baseURLString: String {
        switch self {
        case .process(let process):
            return "https://\(process.processEntity.server)/v1/process"
        }
    }
    
    var method: HTTPMethod {
        .post
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .process(let process):
            return [
                "public_key": Credentials.shared.publicKey,
                "task": process.processEntity.task,
                "tool": process.tool.rawValue,
                "files":[
                    ["server_filename": process.processEntity.serverFilename,
                     "filename": process.processEntity.originalFilename]],
                "compression_level": process.compressionLevel.rawValue
            ]
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            .authorization(bearerToken: Credentials.shared.token),
        ]
    }
    
    var showDebugInfo: Bool {
        true
    }
    
    var parameterEncoding: ParameterEncoding {
        JSONEncoding.default
    }
    
}
