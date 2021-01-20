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
    var networkService: NetworkServiceProtocol
    
    // MARK: - Initializer
    required init(view: LoginViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
    }
    
    // MARK: - Methods
    func tapEmailButton() {
//        router.push(destination: .register(networkService: networkService))
//        router.push(destination: .steps)
//        router.push(destination: .subscription)
        router.push(destination: .main(networkService: networkService))
    }
    func tapFbButton() {
        
    }
    func tapAppleButton() {
        
    }
    func tapSignInButton() {
        
    }
}
