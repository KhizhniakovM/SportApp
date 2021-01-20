//
//  StepFiveViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

class StepFiveViewController: UIViewController {
    // MARK: - Properties
    var router: RouterProtocol!
    var networkService: NetworkServiceProtocol!
    var userInfo: [String: Any]!

    // MARK: - UI
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstStack: UIView!
    @IBOutlet weak var secondStack: UIView!
    @IBOutlet weak var firstStackName: UILabel!
    @IBOutlet weak var secondStackName: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTargets()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarForSteps(with: NSLocalizedString("stepFive", comment: ""))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(firstStack, 5)
        setupCornerRadiusFor(secondStack, 5)
        addShadow()
    }
    
    // MARK: - Methods
    private func setupUI() {
        questionLabel.text = NSLocalizedString("stepFiveQuestion", comment: "")
        firstStackName.text = NSLocalizedString("genderFemale", comment: "")
        secondStackName.text = NSLocalizedString("genderMale", comment: "")
    }
    private func addShadow() {
        addShadowFor(view: firstStack)
        addShadowFor(view: secondStack)
    }
    private func addTargets() {
        let firstTap = UITapGestureRecognizer(target: self, action: #selector(tapStack(sender:)))
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(tapStack(sender:)))
        firstStack.addGestureRecognizer(firstTap)
        secondStack.addGestureRecognizer(secondTap)
    }
    // MARK: - @objc methods
    @objc
    private func tapStack(sender: UITapGestureRecognizer) {
        if sender.view == firstStack {
            userInfo["gender"] = GenderType.female.rawValue
        } else if sender.view == secondStack {
            userInfo["gender"] = GenderType.male.rawValue
        }
        performSegue(withIdentifier: "stepSix", sender: nil)
    }
    // MARK: - IBActions
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StepSixViewController {
            vc.userInfo = self.userInfo
            vc.router = router
            vc.networkService = networkService
        }
    }
}
