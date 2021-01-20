//
//  StepSixViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

class StepSixViewController: UIViewController {
    // MARK: - Properties
    var router: RouterProtocol!
    var networkService: NetworkServiceProtocol!
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
        setupNavigationBarForSteps(with: NSLocalizedString("stepSix", comment: ""))
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
        questionLabel.text = NSLocalizedString("stepSixQuestion", comment: "")
        firstStackName.text = NSLocalizedString("weightThinName", comment: "")
        firstStackDesc.text = NSLocalizedString("weightThinDesc", comment: "")
        secondStackName.text = NSLocalizedString("weightMediumName", comment: "")
        secondStackDesc.text = NSLocalizedString("weightMediumDesc", comment: "")
        thirdStackName.text = NSLocalizedString("weightFatName", comment: "")
        thirdStackDesc.text = NSLocalizedString("weightFatDesc", comment: "")
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
            userInfo["bodyType"] = BodyType.thin.rawValue
        } else if sender.view == secondStack {
            userInfo["bodyType"] = BodyType.medium.rawValue
        } else if sender.view == thirdStack {
            userInfo["bodyType"] = BodyType.fat.rawValue
        }
        performSegue(withIdentifier: "stepSeven", sender: nil)
    }
    // MARK: - IBActions
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StepSevenViewController {
            vc.userInfo = self.userInfo
            vc.router = router
            vc.networkService = networkService
        }
    }
}
