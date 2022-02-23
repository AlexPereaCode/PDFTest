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
        class MainPresenterMock: MainPresenter<MainViewController> {
            var refreshTokenIsCalled = false
            
            override func refreshToken() {
                refreshTokenIsCalled = true
            }
        }
        
        let sut = MainPresenterMock(getTokenUseCase: Assembler.shared.resolve(),
                                    router: MainRouter(viewController: UIViewController()),
                                    startTaskUseCase: Assembler.shared.resolve(),
                                    uploadUseCase: Assembler.shared.resolve())
        sut.viewDidLoad()
        XCTAssertTrue(sut.refreshTokenIsCalled)
    }
    
    func testRefreshToken() {
        let getTokenExpectation = expectation(description: "Get Token...")
        let fakeToken = "742637462378_uiwauyi"
        
        class MainPresenterMock: MainPresenter<MainViewController> {
            let getTokenUseCaseMock = GetTokenUseCaseMock()
            var getTokenExpectation: XCTestExpectation! = nil
            
            override func refreshToken() {
                getTokenUseCaseMock.execute { [weak self] result in
                    self?.getTokenExpectation.fulfill()
                    
                    switch result {
                    case.success(let model):
                        Credentials.shared.token = model.token
                    case .failure:
                        fatalError("Refresh Token Failed")
                    }
                }
            }
        }
        
        Credentials.shared.token = fakeToken
        let sut = MainPresenterMock(getTokenUseCase: Assembler.shared.resolve(),
                                    router: MainRouter(viewController: UIViewController()),
                                    startTaskUseCase: Assembler.shared.resolve(),
                                    uploadUseCase: Assembler.shared.resolve())
        sut.getTokenExpectation = getTokenExpectation
        sut.refreshToken()
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(Credentials.shared.token != fakeToken)
        XCTAssertTrue(Credentials.shared.token == Mocks.token)
    }

    func testDidPickDocument() {
        let mockURL = URL(string: "www.apple.com")!
        sut.didPickDocument(url: mockURL)
        XCTAssertEqual(sut.currentPDFURL!, mockURL)
    }
    
    

}
