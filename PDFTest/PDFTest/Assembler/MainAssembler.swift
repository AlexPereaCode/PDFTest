//
//  AuthenticationAssembler.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation

protocol MainAssembler {
    func resolve() -> MainViewController
    func resolve() -> GetTokenUseCase
    func resolve() -> StartTaskUseCase
    func resolve() -> UploadUseCase
}

extension MainAssembler {
    
    func resolve() -> MainViewController {
        let mainViewController = MainViewController()
        let router = MainRouter(viewController: mainViewController)
        
        mainViewController.presenter = MainPresenter<MainViewController>(
            getTokenUseCase: Assembler.shared.resolve(),
            router: router,
            startTaskUseCase: Assembler.shared.resolve(),
            uploadUseCase: Assembler.shared.resolve())
        
        return mainViewController
    }
    
    func resolve() -> GetTokenUseCase {
        return GetToken()
    }
    
    func resolve() -> StartTaskUseCase {
        return StartTask()
    }
    
    func resolve() -> UploadUseCase {
        return Upload()
    }
    
}
