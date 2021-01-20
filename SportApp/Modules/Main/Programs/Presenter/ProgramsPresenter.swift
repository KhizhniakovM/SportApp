//
//  ProgramsPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import Foundation

final class ProgramsPresenter: ProgramsPresenterProtocol {
    // MARK: - Properties
    weak var view: ProgramsViewProtocol?
    var networkService: NetworkServiceProtocol
    
    var programs: [Program] = []
    
    // MARK: - Initializer
    required init(view: ProgramsViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        
        networkService.databaseService?.downloadProgramsList(completion: { [weak self] (programs) in
            guard let self = self else { return }
            self.programs = programs
            
            view.tableView.reloadData()
        })
    }
    
    // MARK: - Methods
    func push(index: Int) {
        let view = ProgramViewController()
        let presenter = ProgramPresenter(view: view, networkService: networkService, program: programs[index])
        view.presenter = presenter
        self.view?.push(vc: view)
    }
}
