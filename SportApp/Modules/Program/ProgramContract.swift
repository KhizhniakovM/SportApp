//
//  ProgramContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import Foundation

protocol ProgramViewProtocol: class {
    func showExercise(ex: Exercise)
    func showProgram()
    func configure(with program: Program)
}
protocol ProgramPresenterProtocol: class {
    var view: ProgramViewProtocol? { get }
    var networkService: NetworkServiceProtocol { get }
    var program: Program { get }
    
    func showExercise(index: Int)
    func showProgram()
}
