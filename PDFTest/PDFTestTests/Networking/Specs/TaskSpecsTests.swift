//
//  TaskSpecsTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
import Alamofire
@testable import PDFTest

class TaskSpecsTests: XCTestCase {

    private var sut: TaskSpecs!

    override func setUpWithError() throws {
        sut = TaskSpecs.startTask
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testBaseURL() {
        XCTAssertTrue(sut.baseURLString == Credentials.shared.apiBaseURL)
    }
    
    func testPath() {
        XCTAssertTrue(sut.path == "start/compress")
    }
    
    func testHTTPMethod() {
        XCTAssertTrue(sut.method == .get)
    }
    
    func testParams() {
        guard let params = sut.parameters else {
            XCTFail(TestMessages.expectedParametersMessage)
            return
        }
        XCTAssertTrue(params["public_key"] as? String == Credentials.shared.publicKey)
        XCTAssertTrue(params["token"] as? String == Credentials.shared.token)
    }
}
