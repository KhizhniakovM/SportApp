//
//  StatisticsContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import Foundation

protocol StatisticsViewProtocol: class {}
protocol StatisticsPresenterProtocol: class {
    var view: StatisticsViewProtocol? { get }
    var networkService: NetworkServiceProtocol { get }
}
