//
//  UserInfo.swift
//  SportApp
//
//  Created by Max Khizhniakov on 06.12.2020.
//

import Foundation

struct UserInfo {
    var purpose: PurposeType
    var bodyType: BodyType
    var age: Int
    var dateOfBirth: Date
    var weight: Int
    var weightType: WeightType
    var height: Int
    var gender: GenderType
    var level: Level
}

enum WeightType: String {
    case kg, lb
}
enum PurposeType: String {
    case health, muscle, weight
}
enum GenderType: String {
    case male, female
}
enum BodyType: String {
    case thin, medium, fat
}
enum Level: String {
    case start, beginner, medium, advanced, pro
    
    func description() -> String {
        switch self {
        case .start:
            return NSLocalizedString("", comment: "")
        case .beginner:
            return NSLocalizedString("", comment: "")
        case .medium:
            return NSLocalizedString("", comment: "")
        case .advanced:
            return NSLocalizedString("", comment: "")
        case .pro:
            return NSLocalizedString("", comment: "")
        }
    }
}
