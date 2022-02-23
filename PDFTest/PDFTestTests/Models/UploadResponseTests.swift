//
//  UploadResponseTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class UploadResponseTests: XCTestCase {
    
    private var sut: UploadResponse!

    override func setUpWithError() throws {
        sut = try UploadMock().getMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDataSuccess() {
        XCTAssertNotNil(sut)
    }

    func testServerFilename() {
        XCTAssertEqual(sut.server_filename, "0e761886b6080d1f9ef57d20d98044d5b264a96c9e4585d5117cd98ac4ac25d3.pdf")
    }
}
