//
//  UploadUseCase.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import Foundation
import Alamofire

protocol UploadUseCase {
    func execute(
        server: String,
        task: String,
        url: URL,
        fileName: String,
        progress: @escaping (Request.ProgressHandler),
        completion: @escaping (Swift.Result<UploadResponse, Error>) -> Void)
}

struct Upload: UploadUseCase {
    func execute(
        server: String,
        task: String,
        url: URL,
        fileName: String,
        progress: @escaping (Request.ProgressHandler),
        completion: @escaping (Swift.Result<UploadResponse, Error>) -> Void) {
            NetworkRequest<UploadSpecs, UploadResponse>.make(specs: .upload(server: server, task: task), url: url, fileName: fileName) { currentProgress in
                progress(currentProgress)
            } _: { result in
                completion(result)
            }
        }
}
