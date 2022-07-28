//
//  AppDelegate.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        
        if(deviceIdiom == .pad) {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let splitVC = UISplitViewController()
            let primaryViewController = MainViewController()
            let navigationController = UINavigationController(rootViewController: primaryViewController)
            let secondaryViewController = WordDescriptionViewController()
            
            splitVC.viewControllers = [navigationController, secondaryViewController]
            window?.rootViewController = splitVC
            window?.makeKeyAndVisible()
            return true
            
        } else {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = UINavigationController(rootViewController: MainViewController())
            self.window?.makeKeyAndVisible()
            return true
        }

        @available(iOS 13.0, *)
        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        }
        
        @available(iOS 13.0, *)
        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        }
    }
}
