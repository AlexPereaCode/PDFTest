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

    private var taskSpecs: TaskSpecs!

    override func setUpWithError() throws {
        taskSpecs = TaskSpecs.startTask
    }

    override func tearDownWithError() throws {
        taskSpecs = nil
    }

    func testBaseURL() {
        XCTAssertTrue(taskSpecs.baseURLString == Credentials.shared.apiBaseURL)
    }
    
    func testPath() {
        XCTAssertTrue(taskSpecs.path == "start/compress")
    }
    
    func testHTTPMethod() {
        XCTAssertTrue(taskSpecs.method == .get)
    }
    
    func testParams() {
        guard let params = taskSpecs.parameters else {
            XCTFail(TestMessages.expectedParametersMessage)
            return
        }
        XCTAssertTrue(params["public_key"] as? String == Credentials.shared.publicKey)
        XCTAssertTrue(params["token"] as? String == Credentials.shared.token)
    }
}
