//
//  ProgramPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import Foundation

final class ProgramPresenter: ProgramPresenterProtocol {
    // MARK: - Properties
    weak var view: ProgramViewProtocol?
    var networkService: NetworkServiceProtocol
    var program: Program
    
    // MARK: - Initializer
    required init(view: ProgramViewProtocol, networkService: NetworkServiceProtocol, program: Program) {
        self.view = view
        self.networkService = networkService
        self.program = program
        
        configureView()
    }
    
    // MARK: - Methods
    private func configureView() {
        view?.configure(with: program)
    }
    func showExercise(index: Int) {
        view?.showExercise(ex: program.exercises[index])
    }
    func showProgram() {
        view?.showProgram()
    }
}
