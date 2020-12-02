//
//  UIButton+Ex.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit
import SnapKit

enum SignIn {
    case fb
    case apple
    case mail
}

extension UIButton {
    static func makeSignInButton(_ signIn: SignIn) -> UIButton {
        
        let button = UIButton()
        var label: UILabel = UILabel()
        var stack: PassThroughView = PassThroughView()
        var image: UIImage? = UIImage()
        
        switch signIn {
        case .fb:
            button.backgroundColor = .fb
            image = Assets.logoFb.image()
            label = UILabel.makeLabelForButton(NSLocalizedString("signInFB", comment: ""),
                                               with: 20)
            stack = UIView.makeLabelViewForButton(image, label)
        case .apple:
            button.backgroundColor = .white
            image = Assets.logoApple.image()
            label = UILabel.makeLabelForButton(NSLocalizedString("signInApple", comment: ""),
                                               with: 20)
            label.textColor = .black
            stack = UIView.makeLabelViewForButton(image, label)
        case .mail:
            button.backgroundColor = .mail
            label = UILabel.makeLabelForButton(NSLocalizedString("signInMail", comment: ""),
                                               with: 20)
            stack = UIView.makeLabelViewForButton(nil, label)
        }
        
        button.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.centerX.equalTo(button.snp.centerX)
            make.centerY.equalTo(button.snp.centerY)
        }
        
        label.adjustsFontSizeToFitWidth = true
        
        button.clipsToBounds = true
        
        return button
    }
}
