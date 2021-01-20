//
//  StatisticsViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit

final class StatisticsViewController: UIViewController {
    // MARK: - Properties
    var presenter: StatisticsPresenterProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - Extension
extension StatisticsViewController: StatisticsViewProtocol {}
