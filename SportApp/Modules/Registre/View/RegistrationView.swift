//
//  RegistrationView.swift
//  SportApp
//
//  Created by Max Khizhniakov on 04.12.2020.
//

import UIKit
import SnapKit
// MARK: - Enum
enum Label {
    case name, mail, pass
}

// MARK: - Implementation
final class RegistrationView: UIView {
    // MARK: - Properties
    private var isReadyForRegister: Bool {
        get {
            if nameTextField.text != nil &&
                mailTextField.text != "" &&
                mailErrorLabel.alpha != 1 &&
                passTextField.text != "" &&
                passErrorLabel.alpha != 1 {
                return true
            }
            return false
        }
    }
    // MARK: - UI
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("regName", comment: "")
        label.textColor = .gray
        label.font = Font.mainRegular.make(15)
        label.alpha = 0
        return label
    }()
    lazy private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = NSLocalizedString("regName", comment: "")
        textField.textColor = .black
        textField.font = Font.mainRegular.make(17.5)
        textField.tag = 0
        return textField
    }()
    lazy private var nameLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return view
    }()
    lazy private var nameStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(nameLabel)
        stack.setCustomSpacing(5, after: nameLabel)
        stack.addArrangedSubview(nameTextField)
        stack.setCustomSpacing(5, after: nameTextField)
        stack.addArrangedSubview(nameLineView)
        stack.axis = .vertical
        return stack
    }()
    
    lazy private var mailLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("regMail", comment: "")
        label.textColor = .gray
        label.font = Font.mainRegular.make(15)
        label.alpha = 0
        return label
    }()
    lazy private var mailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = NSLocalizedString("regMail", comment: "")
        textField.textColor = .black
        textField.font = Font.mainRegular.make(17.5)
        textField.tag = 1
        textField.keyboardType = .emailAddress
        return textField
    }()
    lazy private var mailLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return view
    }()
    lazy private var mailErrorLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("regMailError", comment: "")
        label.textColor = .error
        label.font = Font.mainRegular.make(12)
        label.alpha = 0
        return label
    }()
    lazy private var mailStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [mailLabel, mailTextField, mailLineView, mailErrorLabel])
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }()
    
    lazy private var passLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("regPass", comment: "")
        label.textColor = .gray
        label.font = Font.mainRegular.make(15)
        label.alpha = 0
        return label
    }()
    lazy private var passTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = NSLocalizedString("regPass", comment: "")
        textField.textColor = .black
        textField.font = Font.mainRegular.make(17.5)
        textField.tag = 2
        textField.isSecureTextEntry = true
        return textField
    }()
    lazy private var passLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return view
    }()
    lazy private var passErrorLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("regPassError", comment: "")
        label.textColor = .error
        label.font = Font.mainRegular.make(12)
        label.alpha = 0
        return label
    }()
    lazy private var passStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passLabel, passTextField, passLineView, passErrorLabel])
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }()
    
    lazy private var privacyLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.font = Font.mainRegular.make(17.5)
        label.textColor = .black
        label.numberOfLines = 2
        
        let text = NSLocalizedString("privacyLabel", comment: "")
        let mutableText = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: NSLocalizedString("privacy", comment: ""))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .center
        
        mutableText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, mutableText.length))
        mutableText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        mutableText.addAttribute(.foregroundColor, value: UIColor.buttonText, range: range)
        
        label.attributedText = mutableText
        return label
    }()
    
    lazy private var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalCentering
        return stack
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func addSubviews() {
        mainStack.addArrangedSubview(nameStack)
        mainStack.setCustomSpacing(20, after: nameStack)
        mainStack.addArrangedSubview(mailStack)
        mainStack.setCustomSpacing(0, after: mailStack)
        mainStack.addArrangedSubview(passStack)
        mainStack.setCustomSpacing(30, after: passStack)
        mainStack.addArrangedSubview(privacyLabel)
        self.addSubview(mainStack)
    }
    private func setupUI() {
        mainStack.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Public methods
    func setup(delegate viewController: UITextFieldDelegate) {
        self.nameTextField.delegate = viewController
        self.mailTextField.delegate = viewController
        self.passTextField.delegate = viewController
    }
    func hide(_ label: Label) {
        switch label {
        case .name:
            self.nameLabel.alpha = 0
        case .mail:
            self.mailLabel.alpha = 0
        case .pass:
            self.passLabel.alpha = 0
        }
    }
    func show(_ label: Label) {
        UIView.animate(withDuration: 0.25) {
            switch label {
            case .name:
                self.nameLabel.alpha = 1
            case .mail:
                self.mailLabel.alpha = 1
            case .pass:
                self.passLabel.alpha = 1
            }
        }
    }
    func error(_ label: Label) {
        switch label {
        case .name:
            break
        case .mail:
            self.mailLabel.textColor = .error
            self.mailLineView.backgroundColor = .error
            self.mailTextField.textColor = .error
            self.mailErrorLabel.alpha = 1
        case .pass:
            self.passLabel.textColor = .error
            self.passLineView.backgroundColor = .error
            self.passTextField.textColor = .error
            self.passErrorLabel.alpha = 1
        }
    }
    func errorResolved(_ label: Label) {
        switch label {
        case .name:
            break
        case .mail:
            self.mailLabel.textColor = .gray
            self.mailLineView.backgroundColor = .gray
            self.mailTextField.textColor = .black
            self.mailErrorLabel.alpha = 0
        case .pass:
            self.passLabel.textColor = .gray
            self.passLineView.backgroundColor = .gray
            self.passTextField.textColor = .black
            self.passErrorLabel.alpha = 0
        }
    }
    func add(target: Any, selector: Selector, for event: UIControl.Event, for textField: Label) {
        switch textField {
        case .name:
            nameTextField.addTarget(target, action: selector, for: event)
        case .mail:
            mailTextField.addTarget(target, action: selector, for: event)
        case .pass:
            passTextField.addTarget(target, action: selector, for: event)
        }
    }
    func add(target: Any, selector: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: selector)
        privacyLabel.addGestureRecognizer(tap)
    }
    func checkReadyForRegister() -> Bool {
        return isReadyForRegister
    }
    func name() -> String? {
        return nameTextField.text
    }
    func mail() -> String? {
        return mailTextField.text
    }
    func pass() -> String? {
        return passTextField.text
    }
}
