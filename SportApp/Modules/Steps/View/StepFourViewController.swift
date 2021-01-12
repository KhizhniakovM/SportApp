//
//  StepFourViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

class StepFourViewController: UIViewController {
    // MARK: - Properties
    var router: RouterProtocol!
    var userInfo: [String: Any]!
    // MARK: - UI
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstStack: UIView!
    @IBOutlet weak var firstStackName: UILabel!
    @IBOutlet weak var firstStackDesc: UILabel!
    @IBOutlet weak var secondStack: UIView!
    @IBOutlet weak var secondStackName: UILabel!
    @IBOutlet weak var secondStackDesc: UILabel!
    @IBOutlet weak var thirdStackName: UILabel!
    @IBOutlet weak var thirdStackDesc: UILabel!
    @IBOutlet weak var thirdStack: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTargets()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarForSteps(with: NSLocalizedString("stepFour", comment: ""))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(firstStack, 5)
        setupCornerRadiusFor(secondStack, 5)
        setupCornerRadiusFor(thirdStack, 5)
        addShadow()
    }
    
    // MARK: - Methods
    private func setupUI() {
        questionLabel.text = NSLocalizedString("stepFourQuestion", comment: "")
        firstStackName.text = NSLocalizedString("purposeHealthName", comment: "")
        firstStackDesc.text = NSLocalizedString("purposeHealthDesc", comment: "")
        secondStackName.text = NSLocalizedString("purposeMuscleName", comment: "")
        secondStackDesc.text = NSLocalizedString("purposeMuscleDesc", comment: "")
        thirdStackName.text = NSLocalizedString("purposeWeightName", comment: "")
        thirdStackDesc.text = NSLocalizedString("purposeWeightDesc", comment: "")
    }
    private func addShadow() {
        addShadowFor(view: firstStack)
        addShadowFor(view: secondStack)
        addShadowFor(view: thirdStack)
    }
    private func addTargets() {
        let firstTap = UITapGestureRecognizer(target: self, action: #selector(tapStack(sender:)))
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(tapStack(sender:)))
        let thirdTap = UITapGestureRecognizer(target: self, action: #selector(tapStack(sender:)))
        firstStack.addGestureRecognizer(firstTap)
        secondStack.addGestureRecognizer(secondTap)
        thirdStack.addGestureRecognizer(thirdTap)
    }
    // MARK: - @objc methods
    @objc
    private func tapStack(sender: UITapGestureRecognizer) {
        if sender.view == firstStack {
            userInfo["purpose"] = PurposeType.health.rawValue
        } else if sender.view == secondStack {
            userInfo["purpose"] = PurposeType.muscle.rawValue
        } else if sender.view == thirdStack {
            userInfo["purpose"] = PurposeType.weight.rawValue
        }
        performSegue(withIdentifier: "stepFive", sender: nil)
    }
    // MARK: - IBActions
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StepFiveViewController {
            vc.userInfo = self.userInfo
            vc.router = router
        }
    }
}
