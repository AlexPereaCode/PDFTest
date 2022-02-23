//
//  ProcessResponseTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class ProcessResponseTests: XCTestCase {

    private var sut: ProcessResponse!
    
    override func setUpWithError() throws {
        sut = try ProcessMock().getMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testDataSuccess() {
        XCTAssertNotNil(sut)
    }
    
    func testDownloadName() {
        XCTAssertEqual(sut.downloadName, "Test.pdf")
    }
    
    func testFileSize() {
        XCTAssertEqual(sut.filesize, 1042157)
    }
    
    func testOutputSize() {
        XCTAssertEqual(sut.outputSize, 205390)
    }
    
    func testOutputNumber() {
        XCTAssertEqual(sut.outputNumber, 1)
    }
    
    func testOutputExtensions() {
        XCTAssertEqual(sut.outputExtensions, "[\"pdf\"]")
    }
    
    func testTimer() {
        XCTAssertEqual(sut.timer, "0.390")
    }
    
    func testStatus() {
        XCTAssertEqual(sut.status, "TaskSuccess")
    }
}
