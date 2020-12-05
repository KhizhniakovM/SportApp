//
//  AppDelegate.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let assembly = Assembly()
        let networkService = assembly.createNetworkService()
        networkService.configureFirebase()
//        try? Auth.auth().signOut()
        
        let navigationController = UINavigationController()
        let router = Router(navigationController: navigationController, assembly: assembly)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        if networkService.isLoggedIn() == .success(true) {
            router.mainViewController(with: networkService)
        } else if networkService.isLoggedIn() == .success(false) {
            router.loginViewController(with: networkService)
        } else if networkService.isLoggedIn() == .failure(.internetConnection) {
            router.presentConnectionError()
        }
        return true
    }
}

