//
//  Assets.swift
//  SportApp
//
//  Created by Max Khizhniakov on 02.12.2020.
//

import UIKit

enum Assets: String {
    case loginBack, loginLogo, logoFb, logoApple
    case back, exit, exitVideo
    
    case pageOne, pageTwo, pageThree
    case iconPrograms, iconExercises, iconStatistics, iconProfile
    case fire, time
    case play
    
    func image() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
