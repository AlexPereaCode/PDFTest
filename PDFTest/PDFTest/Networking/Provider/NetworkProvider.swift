//
//  NetworkProvider.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation
import Alamofire

// MARK: -  Network provider
final public class NetworkProvider<T: NetworkProviderSpecs> {
    
    // MARK: - Request
    public static func request(_ endpoint: T, _ completionHandler: @escaping (AFDataResponse<Any>, NetworkProviderSpecs) -> Void) {
            
        AuthSessionManager
            .current
            .session
            .request(endpoint.url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.parameterEncoding, headers: endpoint.headers)
            .validate()
            .responseJSON(completionHandler: { (response) in
                completionHandler(response, endpoint)
            })
    }
    
    // MARK: - Multipart Request
    public static func multipartRequest(_ endpoint: T, _ url: URL, fileName: String, _ progressHandler: @escaping Request.ProgressHandler, _ completionHandler: @escaping (AFDataResponse<Any>) -> Void) {

       AuthSessionManager
            .current
            .session
            .upload(multipartFormData: { (formData) in
                
            formData.append(url, withName: "file", fileName: fileName, mimeType: "application/pdf")
            if let param = endpoint.parameters?["task"] as? String {
                formData.append(Data(param.utf8), withName: "task")
            }
            
        }, to: endpoint.url, usingThreshold: UInt64(), method: endpoint.method, headers: endpoint.headers, interceptor: nil)
            .uploadProgress(queue: .main, closure: progressHandler)
            .responseJSON(completionHandler: { (response) in
                completionHandler(response)
            })
    }
}

         
