//
//  LoginViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    // MARK: - Properties
    var presenter: LoginPresenterProtocol?
    
    // MARK: - UI
    lazy private var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.loginBack.image()
        return imageView
    }()
    lazy private var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.loginLogo.image()
        return imageView
    }()
    lazy private var emailButton: UIButton = {
        let button = UIButton.makeSignInButton(.mail)
        button.addTarget(self, action: #selector(tapEmailButton(sender:)), for: .touchUpInside)
        return button
    }()
    lazy private var fbButton: UIButton = {
        let button = UIButton.makeSignInButton(.fb)
        button.addTarget(self, action: #selector(tapFbButton(sender:)), for: .touchUpInside)
        return button
    }()
    lazy private var appleButton: UIButton = {
        let button = UIButton.makeSignInButton(.apple)
        button.addTarget(self, action: #selector(tapAppleButton(sender:)), for: .touchUpInside)
        return button
    }()
    lazy private var orLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("or", comment: "")
        label.font = Font.mainRegular.make(17.5)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy private var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailButton, orLabel, appleButton, fbButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    lazy private var haveAccountYetLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.text = NSLocalizedString("haveAccount", comment: "")
        label.font = Font.mainRegular.make(17.5)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy private var signInButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: NSLocalizedString("signIn", comment: ""), attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.underlineColor: UIColor.buttonText,
            ]), for: .normal)
        button.titleLabel?.textColor = .buttonText
        button.addTarget(self, action: #selector(tapSignInButton(sender:)), for: .touchUpInside)
        return button
    }()
    lazy private var signInStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [haveAccountYetLabel, signInButton])
        stack.axis = .vertical
        return stack
    }()
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        addSubviews()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCornerRadius()
    }
    
    // MARK: - Methods
    private func addSubviews() {
        self.view.addSubview(backgroundImage)
        self.view.addSubview(logo)
        self.view.addSubview(buttonStack)
        self.view.addSubview(signInStack)
    }
    private func setupNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.isHidden = true
        navigationBar.alpha = 0
    }
    private func setupUI() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        logo.snp.makeConstraints { (make) in
            make.width.equalTo(logo.snp.height).multipliedBy(1.5)
            make.leading.equalTo(view.snp.leading).offset(width / 5)
            make.top.equalTo(view.snp.top).offset(height / 10)
            make.centerX.equalTo(view.snp.centerX)
        }
        buttonStack.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(width / 8)
            make.trailing.equalTo(view.snp.trailing).offset(-width / 8)
            make.top.equalTo(logo.snp.bottom).offset(height / 5)
            make.height.equalTo(view.snp.height).multipliedBy(0.25)
            make.centerX.equalTo(view.snp.centerX)
        }
        signInStack.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottomMargin).offset(-height / 18)
            make.leading.equalTo(view.snp.leading).offset(width / 5)
            make.trailing.equalTo(view.snp.trailing).offset(-width / 5)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    private func addCornerRadius() {
        fbButton.layer.cornerRadius = fbButton.frame.height / 2
        appleButton.layer.cornerRadius = appleButton.frame.height / 2
        emailButton.layer.cornerRadius = emailButton.frame.height / 2
    }
    // MARK: - @objc methods
    @objc
    private func tapEmailButton(sender: UIButton) {
        presenter?.tapEmailButton()
    }
    @objc
    private func tapFbButton(sender: UIButton) {
        presenter?.tapFbButton()
    }
    @objc
    private func tapAppleButton(sender: UIButton) {
        presenter?.tapAppleButton()
    }
    @objc
    private func tapSignInButton(sender: UIButton) {
        presenter?.tapSignInButton()
    }
}

// MARK: - Extensions
extension LoginViewController: LoginViewProtocol {}
