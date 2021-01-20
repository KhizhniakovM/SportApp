//
//  ProfileViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit

final class ProfileViewСontroller: UIViewController {
    // MARK: - Properties
    var presenter: ProfilePresenterProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
// MARK: - Extension
extension ProfileViewСontroller: ProfileViewProtocol {}
