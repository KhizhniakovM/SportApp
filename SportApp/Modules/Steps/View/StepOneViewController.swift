//
//  StepOneViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

class StepOneViewController: UIViewController {
    // MARK: - Properties
    var userInfo: [String: Any] = [:]
    // MARK: - UI
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDatePicker()
        setupContinueButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarForSteps(with: NSLocalizedString("stepOne", comment: ""))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(continueButton)
    }
    // MARK: - Methods
    private func setupUI() {
        questionLabel.text = NSLocalizedString("stepOneQuestion", comment: "")
        resultLabel.text = " "
    }
    private func setupContinueButton() {
        disable(button: continueButton)
        continueButton.setTitle(NSLocalizedString("continue", comment: ""), for: .normal)
    }
    private func setupDatePicker() {
        datePicker.date = Date()
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(datePickerValueDidChanged), for: .valueChanged)
    }

    // MARK: - @objc methods
    @objc
    private func datePickerValueDidChanged(sender: UIDatePicker) {
        enable(button: continueButton)
        let age = sender.calendar.dateComponents([.year], from: sender.date, to: Date()).year
        userInfo["age"] = age
        userInfo["dateOfBirth"] = sender.date
        resultLabel.text = "\(age!)"
    }
    
    // MARK: - IBActions
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tapContinueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "stepTwo", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StepTwoViewController {
            vc.userInfo = self.userInfo
        }
    }
}

