//
//  StatisticsPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import Foundation

final class StatisticsPresenter: StatisticsPresenterProtocol {
    // MARK: - Properties
    weak var view: StatisticsViewProtocol?
    var networkService: NetworkServiceProtocol
    
    // MARK: - Initializer
    required init(view: StatisticsViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}
