//
//  StepSevenViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

class StepSevenViewController: UIViewController {
    // MARK: - Properties
    var router: RouterProtocol!
    var networkService: NetworkServiceProtocol!
    var userInfo: [String: Any]!
    
    // MARK: - UI
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var beginnerLabel: UILabel!
    @IBOutlet weak var advancedLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContinueButton()
        setupSlider()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarForSteps(with: NSLocalizedString("stepSeven", comment: ""))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(continueButton)
    }
    // MARK: - Methods
    private func setupUI() {
        questionLabel.text = NSLocalizedString("stepSevenQuestion", comment: "")
        resultLabel.text = NSLocalizedString("levelMediumDescription", comment: "")
        userInfo["level"] = Level.medium.rawValue
        beginnerLabel.text = NSLocalizedString("beginner", comment: "")
        advancedLabel.text = NSLocalizedString("advanced", comment: "")
    }
    private func setupContinueButton() {
        continueButton.setTitle(NSLocalizedString("continue", comment: ""), for: .normal)
    }
    private func setupSlider() {
        slider.isContinuous = false
        slider.addTarget(self, action: #selector(sliderValueDidChanged(sender:)), for: .valueChanged)
    }
    // MARK: - IBActions
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapContinueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "lastStep", sender: nil)
    }
    // MARK: - @objc methods
    @objc
    private func sliderValueDidChanged(sender: UISlider) {
        switch sender.value {
        case 0..<0.125:
            slider.setValue(0, animated: true)
            userInfo["level"] = Level.start.rawValue
            resultLabel.text = NSLocalizedString("levelStartDescription", comment: "")
        case 0.125..<0.375:
            slider.setValue(0.25, animated: true)
            userInfo["level"] = Level.beginner.rawValue
            resultLabel.text = NSLocalizedString("levelBeginnerDescription", comment: "")
        case 0.375..<0.625:
            slider.setValue(0.5, animated: true)
            userInfo["level"] = Level.medium.rawValue
            resultLabel.text = NSLocalizedString("levelMediumDescription", comment: "")
        case 0.625..<0.875:
            slider.setValue(0.75, animated: true)
            userInfo["level"] = Level.advanced.rawValue
            resultLabel.text = NSLocalizedString("levelAdvancedDescription", comment: "")
        case 0.875...1:
            slider.setValue(1, animated: true)
            userInfo["level"] = Level.pro.rawValue
            resultLabel.text = NSLocalizedString("levelProDescription", comment: "")
        default:
            fatalError()
        }
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FinalStepViewController {
            vc.userInfo = self.userInfo
            vc.router = router
            vc.networkService = networkService
        }
    }
}
