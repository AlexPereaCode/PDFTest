//
//  ProcessSpecsTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
import Alamofire
@testable import PDFTest

class ProcessSpecsTests: XCTestCase {
    
    private var sut: ProcessSpecs!
    private let processModelMock = Mocks.processRequest

    override func setUpWithError() throws {
        sut = ProcessSpecs.process(process: processModelMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testBaseURL() {
        XCTAssertTrue(sut.baseURLString == "https://\(processModelMock.processEntity.server)/v1/process")
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
        XCTAssertTrue(params["task"] as? String == processModelMock.processEntity.task)
        XCTAssertTrue(params["tool"] as? String == processModelMock.tool.rawValue)
        guard let files = params["files"] as? [[String: Any]] else {
            fatalError(TestMessages.filesError)
        }
        XCTAssertEqual(files.first?["server_filename"] as? String, processModelMock.processEntity.serverFilename)
        XCTAssertEqual(files.first?["filename"] as? String, processModelMock.processEntity.originalFilename)
    }
    
    func testHeaders() {
        XCTAssertEqual(sut.headers?["Authorization"], "Bearer \(Credentials.shared.token)")
    }
}
