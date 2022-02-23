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
    
    private var sut: UploadSpecs!

    override func setUpWithError() throws {
        sut = UploadSpecs.upload(server: Mocks.server, task: Mocks.task)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testBaseURL() {
        XCTAssertTrue(sut.baseURLString == "https://\(Mocks.server)/v1/upload")
    }
    
    func testPath() {
        XCTAssertTrue(sut.path == "")
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
        XCTAssertTrue(params["task"] as? String == Mocks.task)
    }
    
    func testHeaders() {
        XCTAssertEqual(sut.headers?["Authorization"], "Bearer \(Credentials.shared.token)")
    }
}
