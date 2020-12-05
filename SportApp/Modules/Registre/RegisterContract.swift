//
//  RegisterContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

protocol RegisterViewProtocol: class {
    func allowRegistration()
    func disallowRegistration()
    func hideLabel(_ label: Label)
    func showLabel(_ label: Label)
    func errorResolved(_ label: Label)
    func error(_ label: Label)
    func showRegistrationError()
}
protocol RegisterPresenterProtocol: class {
    var view: RegisterViewProtocol? { get }
    var router: RouterProtocol { get }
    
    init(view: RegisterViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol)
    
    func tapBackButton()
    func tapPrivacyLabel()
    func tapContinueButton(name: String, mail: String, pass: String)
    func textFieldDidChanged(_ textField: UITextField)
    func checkReadyForRegister(_ ready: Bool)
}
