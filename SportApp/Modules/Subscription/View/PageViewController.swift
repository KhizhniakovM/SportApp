//
//  PageOneViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 08.12.2020.
//

import UIKit

class PageViewController: UIViewController {
    // MARK: - Enum
    enum Page {
        case first, second, third, fourth, fifth
    }
    // MARK: - Properties
    var currentPage: Int = 0
    // MARK: - UI
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.startAnimation(to: .second)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(startButton)
    }
    // MARK: - Methods
    private func setupUI() {
        label.text = NSLocalizedString("pageOne", comment: "")
        
        startButton.setTitle(NSLocalizedString("try", comment: ""), for: .normal)
    }
    private func startAnimation(to page: Page) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            UIView.transition(with: self.image, duration: 1, options: .transitionCrossDissolve) {
                switch page {
                case .first:
                    self.image.image = Assets.pageOne.image()
                    UIView.transition(with: self.label, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.label.text = NSLocalizedString("pageOne", comment: "")
                    }, completion: nil)
                    self.pageControl.currentPage = 0
                    self.startAnimation(to: .second)
                case .second:
                    self.image.image = Assets.pageTwo.image()
                    UIView.transition(with: self.label, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.label.text = NSLocalizedString("pageTwo", comment: "")
                    }, completion: nil)
                    self.pageControl.currentPage = 1
                    self.startAnimation(to: .third)
                case .third:
                    self.image.image = Assets.pageThree.image()
                    UIView.transition(with: self.label, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.label.text = NSLocalizedString("pageThree", comment: "")
                    }, completion: nil)
                    self.pageControl.currentPage = 2
                    self.startAnimation(to: .fourth)
                case .fourth:
                    self.image.image = Assets.pageOne.image()
                    UIView.transition(with: self.label, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.label.text = NSLocalizedString("pageFour", comment: "")
                    }, completion: nil)
                    self.pageControl.currentPage = 3
                    self.startAnimation(to: .fifth)
                case .fifth:
                    self.image.image = Assets.pageOne.image()
                    UIView.transition(with: self.label, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.label.text = NSLocalizedString("pageFive", comment: "")
                    }, completion: nil)
                    self.pageControl.currentPage = 4
                    self.startAnimation(to: .first)
                }
            } completion: {_ in}
        }
    }
    // MARK: - IBActions
    @IBAction func tapStartButton(_ sender: UIButton) {
        performSegue(withIdentifier: "sub", sender: nil)
    }
}
