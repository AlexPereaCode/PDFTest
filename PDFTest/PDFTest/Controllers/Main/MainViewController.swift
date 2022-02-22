//
//  MainViewController.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import UIKit
import UniformTypeIdentifiers

protocol MainView: BaseView {
    func presentDocumentPicker()
    func showActivityIndicator()
    func hideActivityIndicator()
}

class MainViewController: BaseViewController, MainView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var selectPDFButton: UIButton!
    
    // MARK: - Properties
    var presenter: MainPresenter<MainViewController>? {
        didSet {
            presenter?.view = self
        }
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func showActivityIndicator() {
        showLoading()
    }
    
    func hideActivityIndicator() {
        hideLoading()
    }

    // MARK: - Interactions
    @IBAction func SelectPDFButtonPressed(_ sender: UIButton) {
        presenter?.SelectPDFButtonPressed()
    }
}

extension MainViewController: UIDocumentPickerDelegate {
    
    func presentDocumentPicker() {
        let documentPickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.pdf], asCopy: true)
        documentPickerViewController.delegate = self
        present(documentPickerViewController, animated: true, completion: nil)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let documentUrl = urls.first else { return }
        presenter?.didPickDocument(url: documentUrl)
    }
}
