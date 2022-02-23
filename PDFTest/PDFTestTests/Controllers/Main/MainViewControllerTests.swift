//
//  MainViewControllerTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 23/2/22.
//

import XCTest
@testable import PDFTest

class MainViewControllerTests: XCTestCase {
    
    private var sut: MainViewController!

    override func setUpWithError() throws {
        sut = Assembler.shared.resolve()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testMainControllerCheckInheritanceOfSuperClass() {
        XCTAssertTrue(sut.superclass == BaseViewController.self, "MainViewController inheritance is failed")
    }

    func testPresenterIsInitialized() {
        XCTAssertNotNil(sut.presenter)
    }
    
    func testShowActivityIndicatorMethodCalled() {

        class MainViewControllerMock: BaseViewController, MainView {
            var showActivityCalled = false
            
            func showActivityIndicator() {
                showActivityCalled = true
            }
            func hideActivityIndicator() {}
            func presentDocumentPicker() {}
        }
        
        let sut = MainViewControllerMock()
        XCTAssertEqual(sut.showActivityCalled, false)
        sut.showActivityIndicator()
        XCTAssertEqual(sut.showActivityCalled, true)
    }
    
    func testHideActivityIndicatorMethodCalled() {
        class MainViewControllerMock: BaseViewController, MainView {
            var hideActivityCalled = false
            
            func showActivityIndicator() {}
            func hideActivityIndicator() {
                hideActivityCalled = true
            }
            func presentDocumentPicker() {}
        }
        
        let sut = MainViewControllerMock()
        XCTAssertEqual(sut.hideActivityCalled, false)
        sut.hideActivityIndicator()
        XCTAssertEqual(sut.hideActivityCalled, true)
    }
    
    func testPresentDocumentPickerMethodCalled() {
        class MainViewControllerMock: BaseViewController, MainView {
            var documentPickerCalled = false
            
            func showActivityIndicator() {}
            func hideActivityIndicator() {}
            
            func presentDocumentPicker() {
                documentPickerCalled = true
            }
        }
        
        let sut = MainViewControllerMock()
        XCTAssertEqual(sut.documentPickerCalled, false)
        sut.presentDocumentPicker()
        XCTAssertEqual(sut.documentPickerCalled, true)
    }
    
    func testDocumentPicker() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = sut
        window.makeKeyAndVisible()

        sut.presentDocumentPicker()
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController!.isKind(of: UIDocumentPickerViewController.self))
        
        let documentPickerViewController = sut.presentedViewController as! UIDocumentPickerViewController
        XCTAssertNotNil(documentPickerViewController.delegate)
    }
    
}
