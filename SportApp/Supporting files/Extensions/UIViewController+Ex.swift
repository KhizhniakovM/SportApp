//
//  UIViewController+Ex.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import UIKit

extension UIViewController {
    func enable(button: UIButton) {
        guard !button.isEnabled else { return }
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.25) {
                button.isEnabled = true
                button.alpha = 1
            }
        }
    }
    func disable(button: UIButton) {
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    func setupNavigationBarForSteps(with title: String) {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationItem.title = title
        navigationBar.barStyle = .blackOpaque
        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Font.header.make(17.5),
                                             NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    func setupCornerRadiusFor(_ button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = button.frame.height / 2
    }
    func setupCornerRadiusFor(_ view: UIView, _ radius: CGFloat) {
        view.layer.cornerRadius = radius
    }
    func addShadowFor(view: UIView) {
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
    }
}
