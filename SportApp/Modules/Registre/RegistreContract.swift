//
//  RegistreContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import Foundation

protocol RegistreViewProtocol: class {}
protocol RegisterPresenterProtocol: class {
    var view: RegistreViewProtocol? { get }
    var router: RouterProtocol { get }
    
    init(view: RegistreViewProtocol, router: RouterProtocol)
    
    func tapBackButton()
}
