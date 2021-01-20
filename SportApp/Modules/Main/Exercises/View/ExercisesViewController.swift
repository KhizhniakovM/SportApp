//
//  ExercisesViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit

final class ExercisesViewController: UIViewController {
    // MARK: - Properties
    var presenter: ExercisesPresenterProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

// MARK: - Extension
extension ExercisesViewController: ExercisesViewProtocol {}
