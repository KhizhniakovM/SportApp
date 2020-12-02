//
//  MainPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    // MARK: - Properties
    var view: MainViewProtocol
    var router: RouterProtocol
    
    // MARK: - Initializer
    required init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
}
