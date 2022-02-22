//
//  ProcessMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import Foundation
@testable import PDFTest

final class ProcessMock {
    
    func getMock() throws -> ProcessResponse {
        guard let path = Bundle(for: type(of: self)).path(forResource: "ProcessMock", ofType: "json") else {
            fatalError("Can't find ProcessMock.json file")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return try JSONDecoder().decode(ProcessResponse.self, from: data)
    }
}
