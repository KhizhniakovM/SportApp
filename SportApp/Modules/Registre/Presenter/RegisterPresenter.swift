//
//  RegisterPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

final class RegisterPresenter: RegisterPresenterProtocol {
    // MARK: - Properties
    weak var view: RegisterViewProtocol?
    var router: RouterProtocol
    var networkService: NetworkServiceProtocol
    
    // MARK: - Initializers
    required init(view: RegisterViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
    }
    
    // MARK: - Methods
    func tapContinueButton(name: String, mail: String, pass: String) {
        networkService.registerService?.mailRegistration(name: name, mail: mail, pass: pass, completion: { [weak self] (result) in
            switch result {
            case .success(let id):
                UserDefaultsService.save(id: id, name: name, mail: mail)
                
            case .failure(_):
                self?.view?.showRegistrationError()
            }
        })
    }
    func tapPrivacyLabel() {
        router.push(destination: .privacy)
    }
    func tapBackButton() {
        router.pop()
    }
    func textFieldDidChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            switch textField.tag {
            case 0:
                view?.showLabel(.name)
            case 1:
                view?.showLabel(.mail)
                view?.error(.mail)
            case 2:
                view?.showLabel(.pass)
                view?.error(.pass)
            default:
                fatalError("You have only 3 textfields")
            }
        } else if textField.text?.count == 0 {
            switch textField.tag {
            case 0:
                view?.hideLabel(.name)
                view?.errorResolved(.name)
            case 1:
                view?.hideLabel(.mail)
                view?.errorResolved(.mail)
            case 2:
                view?.hideLabel(.pass)
                view?.errorResolved(.pass)
            default:
                fatalError("You have only 3 textfields")
            }
        } else {
            switch textField.tag {
            case 0:
                break
            case 1:
                guard let text = textField.text else { return }
                if !text.isValidEmail() {
                    view?.error(.mail)
                } else {
                    view?.errorResolved(.mail)
                }
            case 2:
                guard let textCount = textField.text?.count else { return }
                if textCount < 8 || textCount > 20 {
                    view?.error(.pass)
                } else {
                    view?.errorResolved(.pass)
                }
            default:
                fatalError("You have only 3 textfields")
            }
        }
    }
    func checkReadyForRegister(_ ready: Bool) {
        if ready {
            view?.allowRegistration()
        } else {
            view?.disallowRegistration()
        }
    }
}
