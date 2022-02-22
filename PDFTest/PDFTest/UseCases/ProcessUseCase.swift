//
//  ProcessUseCase.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation

protocol ProcessUseCase {
    func execute(processRequest: ProcessRequest, completion: @escaping (Swift.Result<ProcessResponse, Error>) -> Void)
}

struct Process: ProcessUseCase {
    func execute(processRequest: ProcessRequest, completion: @escaping (Swift.Result<ProcessResponse, Error>) -> Void) {
        NetworkRequest<ProcessSpecs, ProcessResponse>.make(specs: .process(process: processRequest)) { result in
            completion(result)
        }
    }
}
