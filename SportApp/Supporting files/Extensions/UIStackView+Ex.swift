//
//  UIStackView+Ex.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit

extension UIStackView {
    static func createStack(image: UIImage, label: String, color: UIColor) -> UIStackView {
        let title = UILabel()
        title.text = label
        title.font = Font.mainMedium.make(12.5)
        title.textColor = color
        
        let imageView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = color
        
        let stack = UIStackView(arrangedSubviews: [imageView, title])
        stack.spacing = 5
        
        return stack
    }
}
