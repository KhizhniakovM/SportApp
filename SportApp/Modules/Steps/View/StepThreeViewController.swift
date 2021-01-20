//
//  StepThreeViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

class StepThreeViewController: UIViewController {
    // MARK: - Properties
    var router: RouterProtocol!
    var networkService: NetworkServiceProtocol!
    var userInfo: [String: Any]!

    // MARK: - UI
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
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
        setupNavigationBarForSteps(with: NSLocalizedString("stepThree", comment: ""))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(continueButton)
    }
    // MARK: - Methods
    private func setupUI() {
        questionLabel.text = NSLocalizedString("stepThreeQuestion", comment: "")
        resultLabel.text = " "
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
        performSegue(withIdentifier: "stepFour", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StepFourViewController {
            vc.userInfo = self.userInfo
            vc.router = router
            vc.networkService = networkService
        }
    }
}

// MARK: - Extenisons
extension StepThreeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UserData.userHeight[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enable(button: continueButton)
        let height: Int = Int(Double(row) * 2.54) + 122
        userInfo["height"] = height
        resultLabel.text = UserData.userHeight[row]
    }
}
extension StepThreeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 36
    }
}
