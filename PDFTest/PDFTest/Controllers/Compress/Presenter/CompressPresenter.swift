//
//  CompressPresenter.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation

final class CompressPresenter<T: CompressView>: BasePresenter<T> {
    
    private let router: CompressRouter
    private let processEntity: ProcessEntity
    private let processUseCase: ProcessUseCase
    private let downloadUseCase: DownloadUseCase
    private var compressType = CompressType.recommended
    
    init(router: CompressRouter,
         processEntity: ProcessEntity,
         processUseCase: ProcessUseCase,
         downloadUseCase: DownloadUseCase) {
        
        self.router = router
        self.processEntity = processEntity
        self.processUseCase = processUseCase
        self.downloadUseCase = downloadUseCase
    }
    
    // MARK: - Public Functions
    func compressionChanged(type: CompressType) {
        compressType = type
    }
    
    func compressionAction() {
        let processRequest = ProcessRequest(processEntity: processEntity, tool: .compress, compressionLevel: compressType)
        view?.showActivityIndicator()
        processUseCase.execute(processRequest: processRequest) { [weak self] result in
            switch result {
            case .success(_):
                self?.download()
            case.failure(let error):
                self?.view?.hideActivityIndicator()
                print(error.localizedDescription)
            }
        }
    }
    
    func download() {
        downloadUseCase.execute(process: processEntity) { [weak self] result in
            DispatchQueue.main.async {
                self?.view?.hideActivityIndicator()
            }
            switch result {
            case .success(let url):
                guard let data = url.data() else { return }
                DispatchQueue.main.async {
                    self?.router.presentPDFViewer(data: data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
