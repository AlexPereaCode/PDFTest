//
//  CompressViewController.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import UIKit
import SwiftUI

protocol CompressView: BaseView {}

class CompressViewController: BaseViewController, CompressView {
    
    @IBOutlet private(set) weak var compressionSelectorView: CompressionSelectorView!
    
    // MARK: - Properties
    var presenter: CompressPresenter<CompressViewController>? {
        didSet {
            presenter?.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compressionSelectorView.delegate = self
    }
    
    func showActivityIndicator() {
        showLoading()
    }
    
    func hideActivityIndicator() {
        hideLoading()
    }
    
    @IBAction func compressButtonPressed(_ sender: BaseButton) {
        presenter?.compressionAction()
    }
}

extension CompressViewController: CompressionSelectorViewDelegate {
    
    func compressionSelected(type: CompressType) {
        presenter?.compressionChanged(type: type)
    }
    
}
