//
//  StartTaskUseCaseMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 23/2/22.
//

import Foundation
@testable import PDFTest

final class StartTaskUseCaseMock: StartTaskUseCase {
    
    var result: Result<StartTaskResponse, Error> = .success(StartTaskResponse(server: Mocks.server, task: Mocks.task))
    
    func execute(completion: @escaping (Result<StartTaskResponse, Error>) -> Void) {
        completion(result)
    }
}
