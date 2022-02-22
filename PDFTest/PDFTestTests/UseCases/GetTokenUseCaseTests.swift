//
//  GetTokenUseCaseTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class GetTokenUseCaseTests: XCTestCase {
    
    private var getTokenUseCaseMock: GetTokenUseCaseMock!
    private var getTokenUseCase: GetTokenUseCase!
    private var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        getTokenUseCaseMock = GetTokenUseCaseMock()
        getTokenUseCase = GetToken()
        expectation = expectation(description: "Get Token...")
    }

    override func tearDownWithError() throws {
        getTokenUseCaseMock = nil
        getTokenUseCase = nil
        expectation = nil
    }
    
    func testGetTokenError() {
        getTokenUseCaseMock.result = .failure(HTTPResponse.noContent)
        var authResponse: AuthResponse?
        
        getTokenUseCaseMock.execute { [weak self] result in
            self?.expectation.fulfill()
            
            switch result {
            case.success(let model):
                authResponse = model
            case .failure:
                authResponse = nil
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(authResponse)
    }
    
    func testGetTokenSuccess() {
        var authResponse: AuthResponse?
        
        getTokenUseCaseMock.execute { [weak self] result in
            self?.expectation.fulfill()
            
            switch result {
            case.success(let model):
                authResponse = model
            case .failure:
                authResponse = nil
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(authResponse)
    }
}
