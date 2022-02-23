//
//  CredentialsTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class CredentialsTests: XCTestCase {
    
    private var sut: Credentials!
    private let token = "ABDHJJS784738749HJHJS"

    override func setUpWithError() throws {
        sut = Credentials.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSaveTokenInDefaults() {
        sut.token = token
        XCTAssertEqual(UserDefaults.standard.string(forKey: "token") ?? "", token)
    }
    
    func testGetTokenFromCredentials() {
        sut.token = token
        XCTAssertEqual(sut.token, token)
    }

    func testAPIBaseURL() {
        XCTAssertEqual(sut.apiBaseURL, "https://api.ilovepdf.com/v1/")
    }
    
    func testPublicKey() {
        XCTAssertEqual(sut.publicKey, "project_public_85f90e1cb3cb9da0c17150b99490f8f9_4_rdAa2ea3a4eadf3ffca103097bcc2e7d7e4")
    }
}
