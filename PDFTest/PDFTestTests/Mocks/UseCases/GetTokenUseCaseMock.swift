//
//  GetTokenUseCaseMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import Foundation
@testable import PDFTest

final class GetTokenUseCaseMock: GetTokenUseCase {
    
    var result: Result<AuthResponse, Error> = .success(AuthResponse(token: Mocks.token))
    
    func execute(completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        completion(result)
    }
}
