//
//  StartTaskUseCase.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import Foundation

protocol StartTaskUseCase {
    func execute(completion: @escaping (Swift.Result<StartTaskResponse, Error>) -> Void)
}

struct StartTask: StartTaskUseCase {
    func execute(completion: @escaping (Swift.Result<StartTaskResponse, Error>) -> Void) {
        NetworkRequest<TaskSpecs, StartTaskResponse>.make(specs: .startTask) { result in
            completion(result)
        }
    }
}
