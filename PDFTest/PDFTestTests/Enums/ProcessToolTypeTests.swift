//
//  ProcessToolTypeTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class ProcessToolTypeTests: XCTestCase {

    func testProcessCompressTool() {
        XCTAssertEqual(ProcessToolType.compress.rawValue, "compress")
    }

}
