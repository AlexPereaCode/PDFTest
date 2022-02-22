//
//  StartTaskMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import Foundation
@testable import PDFTest

final class StartTaskMock {
    
    func getMock() throws -> StartTaskResponse {
        guard let path = Bundle(for: type(of: self)).path(forResource: "StartTaskMock", ofType: "json") else {
            fatalError("Can't find StartTaskMock.json file")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return try JSONDecoder().decode(StartTaskResponse.self, from: data)
    }
}
