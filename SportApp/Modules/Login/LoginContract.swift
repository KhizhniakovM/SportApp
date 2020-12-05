//
//  LoginContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

protocol LoginViewProtocol: class {}
protocol LoginPresenterProtocol: class {
    var view: LoginViewProtocol? { get }
    var router: RouterProtocol { get }
    var networkService: NetworkServiceProtocol { get }
    
    init(view: LoginViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol)
    
    func tapEmailButton()
    func tapFbButton()
    func tapAppleButton()
    func tapSignInButton()
}
