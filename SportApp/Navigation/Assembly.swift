//
//  Assembly.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

protocol AssemblyProtocol {
    func createConnectionError() -> UIViewController
    func createMain(router: RouterProtocol) -> UIViewController
    func createLogin(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UIViewController
    func createRegister(router: RouterProtocol, networkService: NetworkServiceProtocol) -> UIViewController
    func createPrivacy() -> UIViewController
    
    func createNetworkService() -> NetworkServiceProtocol
    func createRegisterService() -> RegisterServiceProtocol
    func createConnectionService() -> ConnectionServiceProtocol
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
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    // MARK: - Services
    func createNetworkService() -> NetworkServiceProtocol {
        let networkService = NetworkService()
        networkService.connectionService = createConnectionService()
        networkService.registerService = createRegisterService()
        return networkService
    }
    func createRegisterService() -> RegisterServiceProtocol {
        return RegisterService()
    }
    func createConnectionService() -> ConnectionServiceProtocol {
        return ConnectionService()
    }
}
