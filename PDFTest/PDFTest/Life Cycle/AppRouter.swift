//
//  AppRouter.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import UIKit

final class AppRouter {
    private(set) var window: UIWindow

    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    func showInitialViewController() {
        let rootViewController: MainViewController = Assembler.shared.resolve()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window.overrideUserInterfaceStyle = .dark
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
