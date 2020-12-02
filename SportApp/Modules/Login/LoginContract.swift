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
    
    init(view: LoginViewProtocol, router: RouterProtocol)
    
    func tapEmailButton()
    func tapFbButton()
    func tapAppleButton()
    func tapSignInButton()
}
