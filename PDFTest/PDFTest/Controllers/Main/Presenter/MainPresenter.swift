//
//  MainPresenter.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import Foundation

final class MainPresenter<T: MainView>: BasePresenter<T> {
    
    private let getTokenUseCase: GetTokenUseCase
    private let router: MainRouter
    private let startTaskUseCase: StartTaskUseCase
    private let uploadUseCase: UploadUseCase
    private var currentPDFURL: URL?
    
    init(
        getTokenUseCase: GetTokenUseCase,
        router: MainRouter,
        startTaskUseCase: StartTaskUseCase,
        uploadUseCase: UploadUseCase) {
            
            self.getTokenUseCase = getTokenUseCase
            self.router = router
            self.startTaskUseCase = startTaskUseCase
            self.uploadUseCase = uploadUseCase
    }
    
    // MARK: - Public Functions
    func viewDidLoad() {
        refreshToken()
    }
    
    func SelectPDFButtonPressed() {
        view?.presentDocumentPicker()
    }
    
    func didPickDocument(url: URL) {
        currentPDFURL = url
        startTask()
    }
    
    // MARK: - Private Functions
    private func refreshToken() {
        getTokenUseCase.execute { result in
            switch result {
            case .success(let authModel):
                Credentials.shared.token = authModel.token
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func startTask() {
        startTaskUseCase.execute { [weak self] result in
            switch result {
            case .success(let startModel):
                self?.upload(start: startModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func upload(start: StartTaskResponse) {
        guard let url = currentPDFURL else { return }
        view?.showActivityIndicator()
        let originalFileName = url.lastPathComponent
        
        uploadUseCase.execute(server: start.server, task: start.task, url: url, fileName: originalFileName) { progress in
            print(progress.fractionCompleted)
        
        } completion: { [weak self] result in
            switch result {
            case.success(let uploadModel):
                self?.view?.hideActivityIndicator()
                let processEntity = ProcessEntity(server: start.server, task: start.task, serverFilename: uploadModel.server_filename, originalFilename: originalFileName)
                self?.router.presentCompressViewController(entity: processEntity)
                
            case .failure(let error):
                self?.view?.hideActivityIndicator()
                print(error.localizedDescription)
            }
        }
    }
}
