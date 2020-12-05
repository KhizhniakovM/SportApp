//
//  ConnectionErrorViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 05.12.2020.
//

import UIKit
import SnapKit

class ConnectionErrorViewController: UIViewController {
    // MARK: - UI
    lazy private var mainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.header.make(20)
        label.text = NSLocalizedString("errorMain", comment: "")
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    lazy private var errorLabel: UILabel = {
        let label = UILabel()
        label.font = Font.header.make(15)
        label.text = NSLocalizedString("errorDesc", comment: "")
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    lazy private var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(Assets.exit.image(), for: .normal)
        button.addTarget(self, action: #selector(tapExitButton), for: .touchUpInside)
        return button
    }()
    lazy private var repeatButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle(NSLocalizedString("errorTry", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(tapTryButton), for: .touchUpInside)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .black
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    // MARK: - Methods
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    private func addSubviews() {
        self.view.addSubview(mainLabel)
        self.view.addSubview(errorLabel)
        self.view.addSubview(closeButton)
        self.view.addSubview(repeatButton)
    }
    private func setupUI() {
        self.view.backgroundColor = .white
        
        
    }
    
    // MARK: - @objc methods
    @objc
    private func tapExitButton(sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    @objc
    private func tapTryButton(sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
