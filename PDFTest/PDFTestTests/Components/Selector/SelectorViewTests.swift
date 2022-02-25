//
//  SelectorViewTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 25/2/22.
//

import XCTest
@testable import PDFTest

class SelectorViewTests: XCTestCase, SelectorViewDelegate {
    
    private var sut: SelectorView!
    private var delegateExpectation: XCTestExpectation!
    private var delegateIsCalled = false

    override func setUpWithError() throws {
        let controller = CompressViewController()
        controller.viewDidLoad()
        
        sut = controller.compressionSelectorView.secondSelector
    }

    override func tearDownWithError() throws {
        sut = nil
        delegateExpectation = nil
    }

    func testViewIsLoaded() {
        XCTAssertTrue(sut != nil)
    }
    
    func testDefaultImplementation() {
        sut.isSelected = false
        XCTAssertEqual(sut.backgroundColor, .white)
        XCTAssertEqual(sut.type, .recommended)
        XCTAssertEqual(sut.button.title(for: .normal), CompressType.recommended.rawValue.capitalized)
    }
    
    func testSelectedImplementation() {
        sut.isSelected = true
        XCTAssertEqual(sut.backgroundColor, Colors.accentColor)
    }
    
    func testDelegate() {
        delegateExpectation = expectation(description: "Delegate")
        sut.delegate = self
        sut.buttonPressed(UIButton())
        
        waitForExpectations(timeout: 1)
        XCTAssertTrue(delegateIsCalled)
    }
    
    // MARK: - SelectorViewDelegate
    func selected(view: SelectorView, type: CompressType) {
        delegateIsCalled = true
        delegateExpectation.fulfill()
    }
}
