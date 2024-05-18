//
//  SceneDelegate.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/16/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
    
        self.window = UIWindow(windowScene: windowScene)
    
        let navigationController = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = navigationController
    
        self.window?.makeKeyAndVisible()
   }
}
