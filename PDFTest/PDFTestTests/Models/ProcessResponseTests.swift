//
//  ProcessResponseTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class ProcessResponseTests: XCTestCase {

    private var processResponse: ProcessResponse!
    
    override func setUpWithError() throws {
        processResponse = try ProcessMock().getMock()
    }

    override func tearDownWithError() throws {
        processResponse = nil
    }

    func testDataSuccess() {
        XCTAssertNotNil(processResponse)
    }
    
    func testDownloadName() {
        XCTAssertEqual(processResponse.downloadName, "Test.pdf")
    }
    
    func testFileSize() {
        XCTAssertEqual(processResponse.filesize, 1042157)
    }
    
    func testOutputSize() {
        XCTAssertEqual(processResponse.outputSize, 205390)
    }
    
    func testOutputNumber() {
        XCTAssertEqual(processResponse.outputNumber, 1)
    }
    
    func testOutputExtensions() {
        XCTAssertEqual(processResponse.outputExtensions, "[\"pdf\"]")
    }
    
    func testTimer() {
        XCTAssertEqual(processResponse.timer, "0.390")
    }
    
    func testStatus() {
        XCTAssertEqual(processResponse.status, "TaskSuccess")
    }
}
