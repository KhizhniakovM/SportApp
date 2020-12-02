//
//  UIView+Ex.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit
import SnapKit

extension UIView {
    static func makeLabelViewForButton(_ image: UIImage?, _ label: UILabel) -> PassThroughView {
        let view = PassThroughView()
        let imageView = UIImageView(image: image)
        let stack = UIStackView()
        
        imageView.contentMode = .scaleAspectFit
        
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(label)
        stack.spacing = 10
        
        stack.axis = .horizontal
        stack.isUserInteractionEnabled = false
        
        view.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
}

class PassThroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if !subview.isHidden &&
                subview.alpha > 0 &&
                subview.isUserInteractionEnabled &&
                subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
}
