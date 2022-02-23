//
//  MainPresenterTests.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 22/2/22.
//

import XCTest
@testable import PDFTest

class MainPresenterTests: XCTestCase {
    
    private var mainViewController: MainViewController!
    private var sut: MainPresenter<MainViewController>!
    
    override func setUpWithError() throws {
        mainViewController = Assembler.shared.resolve()
        sut = mainViewController.presenter
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testViewDidLoad() {
        let sut = getMainPresenterMock()
        sut.viewDidLoad()
        XCTAssertTrue(sut.refreshTokenIsCalled)
    }
    
    func testRefreshToken() {
        let getTokenExpectation = expectation(description: "Get Token...")
        let fakeToken = "742637462378_uiwauyi"
                
        Credentials.shared.token = fakeToken
        let sut = getMainPresenterMock()
        sut.getTokenExpectation = getTokenExpectation
        sut.refreshToken()
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(Credentials.shared.token != fakeToken)
        XCTAssertTrue(Credentials.shared.token == Mocks.token)
    }

    func testDidPickDocument() {
        sut.didPickDocument(url: Mocks.url)
        XCTAssertEqual(sut.currentPDFURL!, Mocks.url)
    }
    
    func testStartTaskIsCalled() {
        let sut = getMainPresenterMock()
        sut.didPickDocument(url: Mocks.url)
        XCTAssertTrue(sut.startTaskIsCalled)
    }
    
    func testStartTask() {
        let startTaskExpectation = expectation(description: "Start Task...")
        let sut = getMainPresenterMock()
        sut.startTaskExpectation = startTaskExpectation
        sut.startTask()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(sut.uploadIsCalled)
    }
    
    // MARK: - Aux Methods
    private func getMainPresenterMock() -> MainPresenterMock {
        MainPresenterMock(getTokenUseCase: GetTokenUseCaseMock(),
                                    router: MainRouter(viewController: UIViewController()),
                                    startTaskUseCase: StartTaskUseCaseMock(),
                                    uploadUseCase: Assembler.shared.resolve())
    }
    

}
