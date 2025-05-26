//
//  SceneDelegate.swift
//  cafinfo
//
//  Created by 김도현 on 5/26/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
        
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        window = UIWindow(windowScene: windowScene)
            
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
            
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
