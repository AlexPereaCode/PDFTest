//
//  AuthSpecsTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
import Alamofire
@testable import PDFTest

class AuthSpecsTests: XCTestCase {
    
    private var sut: AuthSpecs!

    override func setUpWithError() throws {
        sut = AuthSpecs.getToken
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testBaseURL() {
        XCTAssertTrue(sut.baseURLString == Credentials.shared.apiBaseURL)
    }
    
    func testPath() {
        XCTAssertTrue(sut.path == "auth")
    }
    
    func testHTTPMethod() {
        XCTAssertTrue(sut.method == .post)
    }
    
    func testParams() {
        guard let params = sut.parameters else {
            XCTFail(TestMessages.expectedParametersMessage)
            return
        }
        XCTAssertTrue(params["public_key"] as? String == Credentials.shared.publicKey)
    }

}
