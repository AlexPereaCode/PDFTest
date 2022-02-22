//
//  CompressTypeTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class CompressTypeTests: XCTestCase {
    
    func testCompressLowType() {
        XCTAssertEqual(CompressType.low.rawValue, "low")
    }

    func testCompressRecommendedType() {
        XCTAssertEqual(CompressType.recommended.rawValue, "recommended")
    }
    
    func testCompressExtremeType() {
        XCTAssertEqual(CompressType.extreme.rawValue, "extreme")
    }

}
