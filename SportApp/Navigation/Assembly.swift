//
//  Assembly.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

protocol AssemblyProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createLogin(router: RouterProtocol) -> UIViewController
    func createRegister(router: RouterProtocol) -> UIViewController
}

class Assembly: AssemblyProtocol {
    func createLogin(router: RouterProtocol) -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    func createRegister(router: RouterProtocol) -> UIViewController {
        let view = RegisterViewController()
        let presenter = RegisterPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
