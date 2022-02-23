//
//  MainRouterTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 23/2/22.
//

import XCTest
@testable import PDFTest

class MainRouterTests: XCTestCase {
    
    private var sut: MainRouter!
    private var navigationController: UINavigationController!

    override func setUpWithError() throws {
        let mainViewController = MainViewController()
        navigationController = UINavigationController(rootViewController: mainViewController)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        sut = MainRouter(viewController: mainViewController)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }

    func testMainRouterInitialization() {
        XCTAssertNotNil(sut.viewController)
        XCTAssertTrue(sut.viewController!.isKind(of: MainViewController.self))
    }
    
    func testPresentCompressViewController() {
        sut.presentCompressViewController(entity: Mocks.processEntity)
        XCTAssertTrue(navigationController.viewControllers.count == 1)
        XCTAssertNotNil(navigationController.presentedViewController)
        XCTAssertTrue(navigationController.presentedViewController!.isKind(of: CompressViewController.self))
    }
}
