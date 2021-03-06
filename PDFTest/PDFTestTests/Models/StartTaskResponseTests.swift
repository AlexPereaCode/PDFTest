//
//  StartTaskResponseTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class StartTaskResponseTests: XCTestCase {
    
    private var sut: StartTaskResponse!

    override func setUpWithError() throws {
        sut = try StartTaskMock().getMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDataSuccess() {
        XCTAssertNotNil(sut)
    }
    
    func testServerParam() {
        XCTAssertEqual(sut.server, "api19.ilovepdf.com")
    }
    
    func testTaskParam() {
        XCTAssertEqual(sut.task, "g27d4mrsg3ztmnzAgm5d3njAgf453x3yrp50yfnl8zd9m8mjwv6z1xrb9m9frbgyj23Aw6z7q3gtxg0c7n5czq0bzzd0jAp83Aqmq6dgcw3A06p81g3sncx1dvs5bv06lj2shlpkz7dmygy076hlhmz1s2")
    }

}
