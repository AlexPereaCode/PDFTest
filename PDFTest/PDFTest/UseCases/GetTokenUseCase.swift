//
//  GetTokenUseCase.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation

protocol GetTokenUseCase {
    func execute(completion: @escaping (Swift.Result<AuthResponse, Error>) -> Void)
}

struct GetToken: GetTokenUseCase {
    func execute(completion: @escaping (Swift.Result<AuthResponse, Error>) -> Void) {
        NetworkRequest<AuthSpecs, AuthResponse>.make(specs: .getToken, completion: { result in
            completion(result)
        })
    }
}
