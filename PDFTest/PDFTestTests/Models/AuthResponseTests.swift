//
//  AuthResponseTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class AuthResponseTests: XCTestCase {
    
    private var sut: AuthResponse!

    override func setUpWithError() throws {
        sut = try TokenMock().getMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testDataSuccess() {
        XCTAssertNotNil(sut)
    }
    
    func testTokenParam() {
        XCTAssertEqual(sut.token, "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuaWxvdmVwZGYuY29tIiwiYXVkIjoiIiwiaWF0IjoxNjQ0MTU0MDIyLCJuYmYiOjE2NDQxNTQwMjIsImV4cCI6MTY0NDE1NzYyMiwianRpIjoicHJvamVjdF9wdWJsaWNfODVmOTBlMWNiM2NiOWRhMGMxNzE1MGI5OTQ5MGY4ZjlfNF9yZEFhMmVhM2E0ZWFkZjNmZmNhMTAzMDk3YmNjMmU3ZDdlNCJ9.6VfVBUxQkw7rsqTq8eD7TQxL3o7NlZKqZR56JHnW_KA")
    }

}
