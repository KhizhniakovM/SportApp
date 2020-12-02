//
//  RegisterViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

final class RegisterViewController: UIViewController {
    // MARK: - Properties
    var presenter: RegisterPresenterProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupNavigationBar()
    }
    
    // MARK: - Methods
    private func setupUI() {
        self.view.backgroundColor = .white
    }
    private func setupNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationItem.title = NSLocalizedString("registration", comment: "")
        navigationBar.isHidden = false
        navigationBar.barStyle = .blackOpaque
        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Font.header.make(17.5),
                                             NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Assets.back.image(), style: .plain,
                                                           target: self, action: #selector(tapBackButton(sender:)))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    // MARK: - @objc methods
    @objc
    private func tapBackButton(sender: UIBarButtonItem) {
        presenter?.tapBackButton()
    }
}

// MARK: - Extesnions
extension RegisterViewController: RegistreViewProtocol {}
