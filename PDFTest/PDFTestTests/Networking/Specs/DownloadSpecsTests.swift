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

    private var downloadSpecs: DownloadSpecs!
    private let process = Mocks.processEntity
    
    override func setUpWithError() throws {
        downloadSpecs = DownloadSpecs.download(process: process)
    }

    override func tearDownWithError() throws {
        downloadSpecs = nil
    }
    
    func testBaseURL() {
        XCTAssertTrue(downloadSpecs.baseURLString == "https://\(process.server)/v1/download/\(process.task)")
    }
    
    func testPath() {
        XCTAssertTrue(downloadSpecs.path == "")
    }
    
    func testHTTPMethod() {
        XCTAssertTrue(downloadSpecs.method == .get)
    }
    
    func testParams() {
        XCTAssertTrue(downloadSpecs.parameters == nil)
    }
    
    func testHeaders() {
        XCTAssertEqual(downloadSpecs.headers?["Authorization"], "Bearer \(Credentials.shared.token)")
    }

}
