//
//  SceneDelegate.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//
import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        
        if(deviceIdiom == .pad) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            
            let splitVC = UISplitViewController()
            let primaryViewController = MainViewController()
            let secondaryViewController = WordDescriptionViewController()
            let navigationController = UINavigationController(rootViewController: primaryViewController)
            
            splitVC.viewControllers = [navigationController, secondaryViewController]
            window?.rootViewController = splitVC
            window?.makeKeyAndVisible()
        } else {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = UINavigationController(rootViewController:  MainViewController())
            window?.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

