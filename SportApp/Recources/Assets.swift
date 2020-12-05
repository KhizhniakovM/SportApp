//
//  Assets.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

enum Assets: String {
    case loginBack
    case loginLogo
    case logoFb
    case logoApple
    case back
    case exit
    
    func image() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
