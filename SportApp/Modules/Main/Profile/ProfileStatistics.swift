//
//  ProfileStatistics.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import Foundation

protocol ProfileViewProtocol: class {}
protocol ProfilePresenterProtocol: class {
    var view: ProfileViewProtocol? { get }
    var networkService: NetworkServiceProtocol { get }
}
