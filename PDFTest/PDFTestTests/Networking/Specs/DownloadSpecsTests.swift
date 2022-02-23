//
//  DownloadSpecsTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
import Alamofire
@testable import PDFTest

class DownloadSpecsTests: XCTestCase {

    private var sut: DownloadSpecs!
    private let process = Mocks.processEntity
    
    override func setUpWithError() throws {
        sut = DownloadSpecs.download(process: process)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testBaseURL() {
        XCTAssertTrue(sut.baseURLString == "https://\(process.server)/v1/download/\(process.task)")
    }
    
    func testPath() {
        XCTAssertTrue(sut.path == "")
    }
    
    func testHTTPMethod() {
        XCTAssertTrue(sut.method == .get)
    }
    
    func testParams() {
        XCTAssertTrue(sut.parameters == nil)
    }
    
    func testHeaders() {
        XCTAssertEqual(sut.headers?["Authorization"], "Bearer \(Credentials.shared.token)")
    }

}
