//
//  SubscriptionViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 08.12.2020.
//

import UIKit

class SubscriptionViewController: UIViewController {
    // MARK: - Enum
    enum Date {
        case month, season, year
    }
    // MARK: - Properties
    var currentDate: Date? {
        didSet {
            enable(button: buyButton)
        }
    }
    
    // MARK: - UI
    @IBOutlet weak var firstStack: UIView!
    @IBOutlet weak var secondStack: UIView!
    @IBOutlet weak var thirdStack: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstPrice: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondPrice: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var thirdPrice: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLabels()
        setupTargets()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(buyButton)
    }
    
    // MARK: - Methods
    private func setupUI() {
        disableBackgroundColor()
        disable(button: buyButton)
        firstStack.layer.borderWidth = 1
        firstStack.layer.borderColor = UIColor.white.cgColor
        secondStack.layer.borderWidth = 1
        secondStack.layer.borderColor = UIColor.white.cgColor
        thirdStack.layer.borderWidth = 1
        thirdStack.layer.borderColor = UIColor.white.cgColor
        
        exitButton.setImage(Assets.exit.image()?.withRenderingMode(.alwaysTemplate), for: .normal)
        exitButton.tintColor = .white
    }
    private func setupLabels() {
        buyButton.setTitle(NSLocalizedString("trySeven", comment: ""), for: .normal)
        firstLabel.text = NSLocalizedString("firstDateLabel", comment: "")
        secondLabel.text = NSLocalizedString("secondDateLabel", comment: "")
        thirdLabel.text = NSLocalizedString("thirdDateLabel", comment: "")
    }
    private func setupTargets() {
        let firstGR = UITapGestureRecognizer(target: self, action: #selector(takeDate))
        let secondGR = UITapGestureRecognizer(target: self, action: #selector(takeDate))
        let thirdGR = UITapGestureRecognizer(target: self, action: #selector(takeDate))
        
        firstStack.addGestureRecognizer(firstGR)
        secondStack.addGestureRecognizer(secondGR)
        thirdStack.addGestureRecognizer(thirdGR)
    }
    private func disableBackgroundColor() {
        firstStack.backgroundColor = UIColor.black.withAlphaComponent(0)
        secondStack.backgroundColor = UIColor.black.withAlphaComponent(0)
        thirdStack.backgroundColor = UIColor.black.withAlphaComponent(0)
    }
    // MARK: - @objc methods
    @objc
    private func takeDate(sender: UITapGestureRecognizer) {
        disableBackgroundColor()
        if sender.view == firstStack {
            firstStack.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            currentDate = .month
        } else if sender.view == secondStack {
            secondStack.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            currentDate = .season
        } else if sender.view == thirdStack {
            thirdStack.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            currentDate = .year
        }
    }
    // MARK: - IBActions
    @IBAction func tapExitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tapBuyButton(_ sender: UIButton) {
    }
}
