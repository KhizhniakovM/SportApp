//
//  Router.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit
// MARK: - Interface
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assembly: AssemblyProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func loginViewController(with networkService: NetworkServiceProtocol)
    func mainViewController(with networkService: NetworkServiceProtocol)
    func push(destination viewControllers: ViewControllers)
    func presentConnectionError()
    func pop()
    func dismiss()
    func popToRoot()
}

// MARK: - Enum of vc
enum ViewControllers {
    case main
    case register(networkService: NetworkServiceProtocol)
    case privacy
    case steps
    case subscription
}

// MARK: - Implementation
class Router: RouterProtocol {
    // MARK: - Properties
    var navigationController: UINavigationController?
    var assembly: AssemblyProtocol?
    
    // MARK: - Initializer
    init(navigationController: UINavigationController, assembly: AssemblyProtocol) {
        self.navigationController = navigationController
        self.assembly = assembly
    }
    
    // MARK: - Methods
    func loginViewController(with networkService: NetworkServiceProtocol) {
        guard let navigationController = navigationController else { return }
        guard let loginViewController = assembly?.createLogin(router: self, networkService: networkService) else { return }
        navigationController.viewControllers = [loginViewController]
    }
    func mainViewController(with networkService: NetworkServiceProtocol) {
//        guard let navigationController = navigationController else { return }
//        guard let loginViewController = assembly?.createLogin(router: self, networkService: networkService) else { return }
//        navigationController.viewControllers = [loginViewController]
    }
    func push(destination viewControllers: ViewControllers) {
        guard let assembly = assembly else { return }
        var viewController: UIViewController
        
        switch viewControllers {
        case .main:
            viewController = assembly.createMain(router: self)
        case .register(let networkService):
            viewController = assembly.createRegister(router: self, networkService: networkService)
        case .privacy:
            viewController = assembly.createPrivacy()
            navigationController?.present(viewController, animated: true, completion: nil)
            return
        case .steps:
            viewController = assembly.createSteps()
            viewController.modalPresentationStyle = .fullScreen
            ((viewController as! UINavigationController).viewControllers[0] as! StepOneViewController).router = self
            navigationController?.present(viewController, animated: true, completion: nil)
            return
        case .subscription:
            viewController = assembly.createSubscription()
            (viewController as! PageViewController).router = self
//            viewController.modalPresentationStyle = .fullScreen
//            navigationController?.present(viewController, animated: true, completion: nil)
//            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    func dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
    func presentConnectionError() {
        guard let navigationController = navigationController else { return }
        guard let connectionErrorViewController = assembly?.createConnectionError() else { return }
        connectionErrorViewController.modalPresentationStyle = .fullScreen
        navigationController.present(connectionErrorViewController, animated: true, completion: nil)
    }
}
