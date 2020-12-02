//
//  RegisterPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import Foundation

final class RegisterPresenter: RegisterPresenterProtocol {
    // MARK: - Properties
    weak var view: RegistreViewProtocol?
    var router: RouterProtocol
    
    // MARK: - Initializers
    required init(view: RegistreViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Methods
    func tapBackButton() {
        router.pop()
    }
}
