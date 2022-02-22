//
//  BaseViewControllerTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import XCTest
@testable import PDFTest

class BaseViewControllerTests: XCTestCase {
    
    private var baseViewController: BaseViewController!

    override func setUpWithError() throws {
        baseViewController = BaseViewController()
    }

    override func tearDownWithError() throws {
        baseViewController = nil
    }
    
    func testConfigureActivityIndicator() {
        baseViewController.viewDidLoad()
        XCTAssertEqual(baseViewController.activityIndicator.color, .gray)
        XCTAssertTrue(baseViewController.view.subviews.contains(baseViewController.activityIndicator))
    }
    
    func testShowLoading() {
        baseViewController.viewDidLoad()
        baseViewController.showLoading()
        XCTAssertEqual(baseViewController.activityIndicator.isHidden, false)
        XCTAssertEqual(baseViewController.activityIndicator.isAnimating, true)
    }
    
    func testHideLoading() {
        baseViewController.viewDidLoad()
        baseViewController.hideLoading()
        XCTAssertEqual(baseViewController.activityIndicator.isHidden, true)
        XCTAssertEqual(baseViewController.activityIndicator.isAnimating, false)
    }
}
