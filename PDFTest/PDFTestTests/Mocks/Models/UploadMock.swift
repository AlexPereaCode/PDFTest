//
//  UploadMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import Foundation
@testable import PDFTest

final class UploadMock {
    
    func getMock() throws -> UploadResponse {
        guard let path = Bundle(for: type(of: self)).path(forResource: "UploadMock", ofType: "json") else {
            fatalError("Can't find UploadMock.json file")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return try JSONDecoder().decode(UploadResponse.self, from: data)
    }
}
