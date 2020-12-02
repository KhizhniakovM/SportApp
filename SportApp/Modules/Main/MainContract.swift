//
//  MainContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import Foundation

protocol MainViewProtocol: class {}
protocol MainPresenterProtocol: class {
    var view: MainViewProtocol { get }
    var router: RouterProtocol { get }
    init(view: MainViewProtocol, router: RouterProtocol)
}
