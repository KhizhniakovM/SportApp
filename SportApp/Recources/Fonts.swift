//
//  Fonts.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

enum Font {
    case mainRegular
    case mainMedium
    case header
    case mainLight
    
    func make(_ size: CGFloat) -> UIFont {
        switch self {
        case .mainRegular:
            return UIFont(name: "Roboto-Regular", size: size) ?? UIFont()
        case .mainLight:
            return UIFont(name: "Roboto-Light", size: size) ?? UIFont()
        case .header:
            return UIFont(name: "Commissioner-Medium", size: size) ?? UIFont()
        case .mainMedium:
            return UIFont(name: "Roboto-Medium", size: size) ?? UIFont()
        }
    }
}
