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
    func initialViewController()
    func push(destination viewControllers: ViewControllers)
    func pop()
    func popToRoot()
}

// MARK: - Enum of vc
enum ViewControllers {
    case main
    case register
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
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let loginViewController = assembly?.createLogin(router: self) else { return }
        navigationController.viewControllers = [loginViewController]
    }
    func push(destination viewControllers: ViewControllers) {
        guard let assembly = assembly else { return }
        var viewController: UIViewController
        
        switch viewControllers {
        case .main:
            viewController = assembly.createMain(router: self)
        case .register:
            viewController = assembly.createRegister(router: self)
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}
