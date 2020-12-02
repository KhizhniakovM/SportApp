//
//  MainViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    weak var presenter: MainPresenterProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
}

// MARK: - Extensions
extension MainViewController: MainViewProtocol {}
