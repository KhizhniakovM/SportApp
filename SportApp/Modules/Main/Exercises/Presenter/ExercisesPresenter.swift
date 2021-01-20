//
//  ExercisesPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import Foundation

final class ExercisesPresenter: ExercisesPresenterProtocol {
    // MARK: - Properties
    weak var view: ExercisesViewProtocol?
    var networkService: NetworkServiceProtocol
    
    // MARK: - Initializer
    required init(view: ExercisesViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}
