//
//  Assembly.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

protocol AssemblyProtocol {
    func createConnectionError() -> UIViewController
    func createMain(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UITabBarController
    func createLogin(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UIViewController
    func createRegister(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UIViewController
    func createPrivacy() -> UIViewController
    func createSteps() -> UIViewController
    func createSubscription() -> UIViewController
    
    func createNetworkService() -> NetworkServiceProtocol
    func createRegisterService() -> RegisterServiceProtocol
    func createConnectionService() -> ConnectionServiceProtocol
    func createDatabaseService() -> FirebaseDatabaseServiceProtocol
}

class Assembly: AssemblyProtocol {
    // MARK: - Modules
    func createConnectionError() -> UIViewController {
        return ConnectionErrorViewController()
    }
    func createPrivacy() -> UIViewController {
        return PrivacyViewController()
    }
    func createLogin(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, router: router, networkService: networkService)
        view.presenter = presenter
        return view
    }
    func createRegister(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UIViewController {
        let view = RegisterViewController()
        let presenter = RegisterPresenter(view: view, router: router, networkService: networkService)
        view.presenter = presenter
        return view
    }
    func createMain(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UITabBarController {
        let view = MainViewController()
        view.networkService = networkService
        return view
    }
    func createSteps() -> UIViewController {
        let storyboard = UIStoryboard(name: "Steps", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "stepOne") as! UINavigationController
    }
    func createSubscription() -> UIViewController {
        let storyboard = UIStoryboard(name: "Subscription", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "page")
    }
    // MARK: - Services
    func createNetworkService() -> NetworkServiceProtocol {
        let networkService = NetworkService()
        networkService.connectionService = createConnectionService()
        networkService.registerService = createRegisterService()
        networkService.databaseService = createDatabaseService()
        return networkService
    }
    func createRegisterService() -> RegisterServiceProtocol {
        return RegisterService()
    }
    func createConnectionService() -> ConnectionServiceProtocol {
        return ConnectionService()
    }
    func createDatabaseService() -> FirebaseDatabaseServiceProtocol {
        return FirebaseDatabaseService()
    }
}
