//
//  CompressionSelectorViewTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 25/2/22.
//

import XCTest
@testable import PDFTest

class CompressionSelectorViewTests: XCTestCase, CompressionSelectorViewDelegate {
    
    private var sut: CompressionSelectorView!
    private var delegateExpectation: XCTestExpectation!
    private var delegateIsCalled = false

    override func setUpWithError() throws {
        let controller = CompressViewController()
        controller.viewDidLoad()
        
        sut = controller.compressionSelectorView
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testViewIsLoaded() {
        XCTAssertTrue(sut != nil)
    }
    
    func testContainerViewDefaultImplementation() {
        XCTAssertTrue(sut.containerView.layer.cornerRadius == 12)
    }
    
    func testFirstSelectorDefaultImplementation() {
        XCTAssertNotNil(sut.firstSelector.delegate)
        XCTAssertEqual(sut.firstSelector.type, .low)
        XCTAssertFalse(sut.firstSelector.isSelected)
    }
    
    func testSecondSelectorDefaultImplementation() {
        XCTAssertNotNil(sut.secondSelector.delegate)
        XCTAssertEqual(sut.secondSelector.type, .recommended)
        XCTAssertTrue(sut.secondSelector.isSelected)
    }
    
    func testThirdSelectorDefaultImplementation() {
        XCTAssertNotNil(sut.thirdSelector.delegate)
        XCTAssertEqual(sut.thirdSelector.type, .extreme)
        XCTAssertFalse(sut.thirdSelector.isSelected)
    }
    
    func testDelegate() {
        delegateExpectation = expectation(description: "Delegate")
        sut.delegate = self
        sut.selected(view: SelectorView(), type: .recommended)
        
        waitForExpectations(timeout: 1)
        XCTAssertTrue(delegateIsCalled)
    }
    
    // MARK: - CompressionSelectorViewDelegate
    func compressionSelected(type: CompressType) {
        delegateIsCalled = true
        delegateExpectation.fulfill()
    }
}
