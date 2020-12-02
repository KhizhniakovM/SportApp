//
//  Fonts.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

enum Font {
    case main
    case header
    
    func make(_ size: CGFloat) -> UIFont {
        switch self {
        case .main:
            return UIFont(name: "Roboto-Regular", size: size) ?? UIFont()
        case .header:
            return UIFont(name: "Commissioner-Medium", size: size) ?? UIFont()
        }
    }
}
