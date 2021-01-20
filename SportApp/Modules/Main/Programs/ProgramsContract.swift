//
//  ProgramsContract.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit

protocol ProgramsViewProtocol: class {
    var tableView: UITableView { get }
    
    func push(vc: UIViewController)
}
protocol ProgramsPresenterProtocol: class {
    var view: ProgramsViewProtocol? { get }
    var networkService: NetworkServiceProtocol { get }
    var programs: [Program] { get }
    
    func push(index: Int)
}
