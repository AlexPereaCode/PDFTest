//
//  UploadSpecsTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
import Alamofire
@testable import PDFTest

class UploadSpecsTests: XCTestCase {
    
    private var uploadSpecs: UploadSpecs!

    override func setUpWithError() throws {
        uploadSpecs = UploadSpecs.upload(server: Mocks.server, task: Mocks.task)
    }

    override func tearDownWithError() throws {
        uploadSpecs = nil
    }

    func testBaseURL() {
        XCTAssertTrue(uploadSpecs.baseURLString == "https://\(Mocks.server)/v1/upload")
    }
    
    func testPath() {
        XCTAssertTrue(uploadSpecs.path == "")
    }
    
    func testHTTPMethod() {
        XCTAssertTrue(uploadSpecs.method == .post)
    }
    
    func testParams() {
        guard let params = uploadSpecs.parameters else {
            XCTFail(TestMessages.expectedParametersMessage)
            return
        }
        XCTAssertTrue(params["public_key"] as? String == Credentials.shared.publicKey)
        XCTAssertTrue(params["task"] as? String == Mocks.task)
    }
    
    func testHeaders() {
        XCTAssertEqual(uploadSpecs.headers?["Authorization"], "Bearer \(Credentials.shared.token)")
    }
}
