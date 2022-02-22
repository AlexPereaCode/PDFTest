//
//  TokenMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import Foundation
@testable import PDFTest

final class TokenMock {
    
    func getMock() throws -> AuthResponse {
        guard let path = Bundle(for: type(of: self)).path(forResource: "TokenMock", ofType: "json") else {
            fatalError("Can't find TokenMock.json file")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return try JSONDecoder().decode(AuthResponse.self, from: data)
    }
}
