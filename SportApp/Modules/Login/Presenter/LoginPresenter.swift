//
//  LoginPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import Foundation
import FirebaseAuth

final class LoginPresenter: LoginPresenterProtocol {
    // MARK: - Properties
    weak var view: LoginViewProtocol?
    var router: RouterProtocol
    
    // MARK: - Initializer
    required init(view: LoginViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Methods
    func tapEmailButton() {
        router.push(destination: .register)
    }
    func tapFbButton() {
        
    }
    func tapAppleButton() {
        
    }
    func tapSignInButton() {
        
    }
}
