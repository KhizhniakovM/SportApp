//
//  ProgramContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import UIKit

protocol ProgramViewProtocol: class {
    func showExercise(ex: Exercise)
    func showProgram(vc: UIViewController)
    func configure(with program: Program)
}
protocol ProgramPresenterProtocol: class {
    var view: ProgramViewProtocol? { get }
    var networkService: NetworkServiceProtocol { get }
    var program: Program { get }
    
    func showExercise(index: Int)
    func showProgram()
    func downloadExercise(index: Int)
    func isDownloaded(index: Int) -> Bool
}
