//
//  NetworkRequest.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation
import Alamofire

enum HTTPResponse: Int, Decodable, Error {
    case ok = 200
    case noContent = 204
    case error = 400
    case unauthorized = 401
}

final class NetworkRequest<S: NetworkProviderSpecs, R: Codable> {
    
    // MARK: - Request
    public static func make(specs: S, completion: @escaping (Swift.Result<R, Error>) -> Void) {
         NetworkProvider<S>.request(specs) { (response, specs) in
             
             if specs.showDebugInfo {
                 print("\(specs)\n\(response)")
             }
             
             switch response.result {
             case .success:
                 guard let data = response.data else {
                     completion(.failure(HTTPResponse.noContent))
                     return
                 }
                 
                 do {
                     let parsed: R = try JSONDecoder().decode(R.self, from: data)
                     completion(.success(parsed))
                 } catch {
                     completion(.failure(error))
                 }
             case .failure(let error):
                 completion(.failure(error))
             }
        }
    }
    
    // MARK: - Multipart
    public static func make(specs: S, url: URL, fileName: String, _ progress: @escaping (Request.ProgressHandler), _ completion: @escaping (Swift.Result<R, Error>) -> Swift.Void) {
        NetworkProvider<S>.multipartRequest(specs, url, fileName: fileName, progress) { (response) in
            
            if specs.showDebugInfo {
                print("\(specs)\n\(response)")
            }
            
            switch response.result {
                
            case .success:
                guard let data = response.data else {
                    completion(.failure(HTTPResponse.noContent))
                    return
                }
                do {
                    let parsed: R = try JSONDecoder().decode(R.self, from: data)
                    completion(.success(parsed))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Download
    public static func makeDownload(specs: S, completion: @escaping (Swift.Result<URL, Error>) -> Swift.Void) {
        guard let headers = specs.headers else { return }
        var urlRequest = URLRequest(url: specs.url)
        urlRequest.httpMethod = specs.method.rawValue
        urlRequest.headers = headers
        
        let task = URLSession.shared.downloadTask(with: urlRequest) { url, request, error in
            
            if specs.showDebugInfo {
                print("\(specs)\n\(String(describing: url))\(String(describing: error))")
            }
            
            if let url = url {
                completion(.success(url))
                return
            }
            completion(.failure(error!))
        }
        task.resume()
    }
}
