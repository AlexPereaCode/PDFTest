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
    
    private var authSpecs: AuthSpecs!

    override func setUpWithError() throws {
        authSpecs = AuthSpecs.getToken
    }

    override func tearDownWithError() throws {
        authSpecs = nil
    }

    func testBaseURL() {
        XCTAssertTrue(authSpecs.baseURLString == Credentials.shared.apiBaseURL)
    }
    
    func testPath() {
        XCTAssertTrue(authSpecs.path == "auth")
    }
    
    func testHTTPMethod() {
        XCTAssertTrue(authSpecs.method == .post)
    }
    
    func testParams() {
        guard let params = authSpecs.parameters else {
            XCTFail(TestMessages.expectedParametersMessage)
            return
        }
        XCTAssertTrue(params["public_key"] as? String == Credentials.shared.publicKey)
    }

}
