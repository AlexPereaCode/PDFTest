//
//  SceneDelegate.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appRouter: AppRouter!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        appRouter = AppRouter(window: UIWindow(windowScene: windowScene))
        appRouter.showInitialViewController()
    }

}

