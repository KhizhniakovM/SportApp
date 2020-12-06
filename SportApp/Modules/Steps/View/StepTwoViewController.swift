//
//  StepTwoViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

class StepTwoViewController: UIViewController {
    // MARK: - Properties
    var userInfo: [String: Any]!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTwoLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var continueButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPicker()
        setupContinueButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarForSteps(with: NSLocalizedString("stepTwo", comment: ""))
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(continueButton)
    }
    // MARK: - Methods
    private func setupUI() {
        questionLabel.text = NSLocalizedString("stepTwoQuestion", comment: "")
        resultLabel.text = "  "
        resultTwoLabel.text = "kg"
    }
    private func setupPicker() {
        picker.delegate = self
        picker.dataSource = self
    }
    private func setupContinueButton() {
        disable(button: continueButton)
        continueButton.setTitle(NSLocalizedString("continue", comment: ""), for: .normal)
    }
    // MARK: - IBActions
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapContinueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "stepThree", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StepThreeViewController {
            vc.userInfo = self.userInfo
        }
    }
}
// MARK: - Extensions
extension StepTwoViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(row + 40)"
        } else {
            if row == 0 {
                return "kg"
            } else {
                return "lb"
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            enable(button: continueButton)
            resultLabel.text = "\(row + 40)"
            userInfo["weight"] = row + 40
        } else {
            if row == 0 {
                resultTwoLabel.text = "kg"
                userInfo["weightType"] = WeightType.kg.rawValue
            } else {
                resultTwoLabel.text = "lb"
                userInfo["weightType"] = WeightType.lb.rawValue
            }
        }
    }
}
extension StepTwoViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 100
        } else {
            return 2
        }
    }
}
