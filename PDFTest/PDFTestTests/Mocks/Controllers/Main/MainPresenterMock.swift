//
//  MainPresenterMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 23/2/22.
//

import XCTest
@testable import PDFTest

class MainPresenterMock: MainPresenter<MainViewController> {
    let getTokenUseCaseMock = GetTokenUseCaseMock()
    let startTaskUseCaseMock = StartTaskUseCaseMock()
    
    var getTokenExpectation = XCTestExpectation()
    var startTaskExpectation = XCTestExpectation()
    
    var refreshTokenIsCalled = false
    var startTaskIsCalled = false
    var uploadIsCalled = false
    
    override func refreshToken() {
        refreshTokenIsCalled = true
        
        getTokenUseCaseMock.execute { [weak self] result in
            self?.getTokenExpectation.fulfill()
            
            switch result {
            case .success(let model):
                Credentials.shared.token = model.token
            case .failure:
                fatalError("Refresh Token Failed")
            }
        }
    }
    
    override func startTask() {
        startTaskIsCalled = true
        
        startTaskUseCaseMock.execute { [weak self] result in
            self?.startTaskExpectation.fulfill()
            
            switch result {
            case .success(let model):
                self?.upload(start: model)
            case .failure:
                fatalError("Start Task Failed")
            }
        }
    }
    
    override func upload(start: StartTaskResponse) {
        uploadIsCalled = true
    }
    
}

