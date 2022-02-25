//
//  BaseViewControllerTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class BaseViewControllerTests: XCTestCase {
    
    private var sut: BaseViewController!

    override func setUpWithError() throws {
        sut = BaseViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testConfigureActivityIndicator() {
        sut.viewDidLoad()
        XCTAssertEqual(sut.activityIndicator.color, .gray)
        XCTAssertTrue(sut.view.subviews.contains(sut.activityIndicator))
    }
    
    func testShowLoading() {
        sut.viewDidLoad()
        sut.showLoading()
        XCTAssertEqual(sut.activityIndicator.isHidden, false)
        XCTAssertEqual(sut.activityIndicator.isAnimating, true)
    }
    
    func testHideLoading() {
        sut.viewDidLoad()
        sut.hideLoading()
        XCTAssertEqual(sut.activityIndicator.isHidden, true)
        XCTAssertEqual(sut.activityIndicator.isAnimating, false)
    }
}
