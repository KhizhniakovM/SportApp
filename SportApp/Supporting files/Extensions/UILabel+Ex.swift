//
//  UILabel+Ex.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

extension UILabel {
    static func makeLabelForButton(_ text: String, with size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Font.mainRegular.make(size)
        label.textColor = .white
        return label
    }
}
