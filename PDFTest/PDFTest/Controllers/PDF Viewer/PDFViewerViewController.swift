//
//  PDFViewerViewController.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import UIKit
import PDFKit
import Alamofire

class PDFViewerViewController: UIViewController {

    @IBOutlet private weak var containerView: UIView!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    public func setPDFViewer(data: Data) {
        let PDFView = PDFView(frame: view.bounds)
        PDFView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        PDFView.autoScales = true
        containerView.addSubview(PDFView)
        PDFView.document = PDFDocument(data: data)
    }
}
