//
//  FinalStepViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 08.12.2020.
//

import UIKit

class FinalStepViewController: UIViewController {
    // MARK: - Properties
    var userInfo: [String: Any]!
    
    // MARK: - UI
    @IBOutlet weak var congratulations: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContinueButton()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(continueButton)
    }
    
    // MARK: - Methods
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        congratulations.text = NSLocalizedString("congratulations", comment: "")
        descriptionText.text = NSLocalizedString("congDesc", comment: "")
    }
    private func setupContinueButton() {
        continueButton.setTitle(NSLocalizedString("start", comment: ""), for: .normal)
    }
    // MARK: - Lifecycle
    @IBAction func tapContinueButton(_ sender: UIButton) {
    }
}
