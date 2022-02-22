//
//  ProcessAssembler.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation

protocol ProcessAssembler {
    func resolve(entity: ProcessEntity) -> CompressViewController
    func resolve() -> ProcessUseCase
    func resolve() -> DownloadUseCase
}

extension ProcessAssembler {
    
    func resolve(entity: ProcessEntity) -> CompressViewController {
        let compressViewController = CompressViewController()
        let router = CompressRouter(viewController: compressViewController)
        
        compressViewController.presenter = CompressPresenter<CompressViewController>(
            router: router,
            processEntity: entity,
            processUseCase: Assembler.shared.resolve(),
            downloadUseCase: Assembler.shared.resolve())
        
        return compressViewController
    }
    
    func resolve() -> ProcessUseCase {
        return Process()
    }
    
    func resolve() -> DownloadUseCase {
        return Download()
    }
}
