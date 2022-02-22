//
//  CompressRouter.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import UIKit
import SwiftUI

final class CompressRouter {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func presentPDFViewer(data: Data) {
        let viewerController = PDFViewerViewController()
        viewerController.setPDFViewer(data: data)
        viewController?.present(viewerController, animated: true, completion: nil)
    }
}
