//
//  ProfilePresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import Foundation

final class ProfilePresenter: ProfilePresenterProtocol {
    // MARK: - Properties
    weak var view: ProfileViewProtocol?
    var networkService: NetworkServiceProtocol
    
    // MARK: - Initializer
    init(view: ProfileViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}
