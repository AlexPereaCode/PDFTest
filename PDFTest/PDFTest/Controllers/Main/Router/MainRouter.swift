//
//  MainRouter.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import UIKit

final class MainRouter {
    private(set) weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func presentCompressViewController(entity: ProcessEntity) {
        let compressViewController: CompressViewController = Assembler.shared.resolve(entity: entity)
        viewController?.navigationController?.present(compressViewController, animated: true, completion: nil)
    }
}
