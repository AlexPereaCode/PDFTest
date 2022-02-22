//
//  DownloadUseCase.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation
import Alamofire

protocol DownloadUseCase {
    func execute(process: ProcessEntity,
                 completion: @escaping (Swift.Result<URL, Error>) -> Void)
}

struct Download: DownloadUseCase {
    func execute(process: ProcessEntity,
                 completion: @escaping (Swift.Result<URL, Error>) -> Void) {
        NetworkRequest<DownloadSpecs, URL>.makeDownload(specs: .download(process: process)) { result in
            completion(result)
        }
    }
}
