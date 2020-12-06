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
    
    // MARK: - UI
    let regView: RegistrationView = {
        let view = RegistrationView()
        return view
    }()
    let continueButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapContinueButton), for: .touchUpInside)
        button.setTitle(NSLocalizedString("continue", comment: ""), for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .black
        button.titleLabel?.font = Font.mainRegular.make(15)
        button.isEnabled = false
        button.alpha = 0.5
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupDelegate()
        addTargets()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupNavigationBar()
        addCornerRadius()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addCornerRadius()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNavigationBar()
    }
    
    // MARK: - Methods
    private func addSubviews() {
        self.view.addSubview(regView)
        self.view.addSubview(continueButton)
    }
    private func addCornerRadius() {
        self.continueButton.layer.cornerRadius = self.continueButton.frame.height / 2
    }
    private func setupUI() {
        self.view.backgroundColor = .white
        
        let height = UIScreen.main.bounds.height
        
        regView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(height / 8)
            make.leading.equalTo(view.snp_leadingMargin).offset(20)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-20)
            make.height.equalTo(view.snp.height).multipliedBy(0.375)
        }
        continueButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).offset(-50)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(view.snp.height).multipliedBy(0.0625)
        }
    }
    private func setupNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationItem.title = NSLocalizedString("registration", comment: "")
        navigationBar.barStyle = .blackOpaque
        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Font.header.make(17.5),
                                             NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Assets.back.image(), style: .plain,
                                                           target: self, action: #selector(tapBackButton(sender:)))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    private func showNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        UIView.animate(withDuration: 0.25) {
            navigationBar.isHidden = false
            navigationBar.alpha = 1
        }
    }
    private func setupDelegate() {
        self.regView.setup(delegate: self)
    }
    private func addTargets() {
        self.regView.add(target: self, selector: #selector(changeTextFieldText), for: .editingChanged, for: .name)
        self.regView.add(target: self, selector: #selector(changeTextFieldText), for: .editingChanged, for: .mail)
        self.regView.add(target: self, selector: #selector(changeTextFieldText), for: .editingChanged, for: .pass)
        self.regView.add(target: self, selector: #selector(tapPrivacyLabel))
    }
    
    // MARK: - @objc methods
    @objc
    private func tapBackButton(sender: UIBarButtonItem) {
        presenter?.tapBackButton()
    }
    @objc
    private func changeTextFieldText(sender: UITextField) {
        presenter?.textFieldDidChanged(sender)
        presenter?.checkReadyForRegister(regView.checkReadyForRegister())
    }
    @objc
    private func tapPrivacyLabel(sender: UITapGestureRecognizer) {
        presenter?.tapPrivacyLabel()
    }
    @objc
    private func tapContinueButton(sender: UIButton) {
        guard let name = regView.name(), let mail = regView.mail(), let pass = regView.pass() else { return }
        presenter?.tapContinueButton(name: name, mail: mail, pass: pass)
    }
}

// MARK: - Extesnions
extension RegisterViewController: RegisterViewProtocol {
    func showRegistrationError() {
        let ac = UIAlertController(title: NSLocalizedString("errorReg", comment: ""),
                                   message: NSLocalizedString("errorRegDesc", comment: ""),
                                   preferredStyle: .alert)
        let cancel = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil)
        ac.addAction(cancel)
        self.present(ac, animated: true, completion: nil)
    }
    func allowRegistration() {
        UIView.animate(withDuration: 0.25) {
            self.continueButton.alpha = 1
            self.continueButton.isEnabled = true
        }
    }
    func disallowRegistration() {
        UIView.animate(withDuration: 0.25) {
            self.continueButton.alpha = 0.5
            self.continueButton.isEnabled = false
        }
    }
    func errorResolved(_ label: Label) {
        regView.errorResolved(label)
    }
    func error(_ label: Label) {
        regView.error(label)
    }
    func hideLabel(_ label: Label) {
        regView.hide(label)
    }
    func showLabel(_ label: Label) {
        regView.show(label)
    }
}
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
