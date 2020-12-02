//
//  AppDelegate.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        addFirebase()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        let assembly = Assembly()
        let router = Router(navigationController: navigationController, assembly: assembly)
        router.initialViewController()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func addFirebase() {
        FirebaseApp.configure()
    }
}

