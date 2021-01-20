//
//  ExercisesContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import Foundation

protocol ExercisesViewProtocol: class {}
protocol ExercisesPresenterProtocol: class {
    var view: ExercisesViewProtocol? { get }
    var networkService: NetworkServiceProtocol { get }
}
