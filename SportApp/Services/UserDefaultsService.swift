//
//  UserDefaultsService.swift
//  SportApp
//
//  Created by Max Khizhniakov on 05.12.2020.
//

import Foundation
enum User: String {
    case id, name, mail, photo
}

final class UserDefaultsService {
    static func save(id: String, name: String, mail: String) {
        save(name, for: .name)
        save(id, for: .id)
        save(mail, for: .mail)
    }
    static func deleteAll() {
        let ud = UserDefaults.standard
        ud.setValue(nil, forKey: User.id.rawValue)
        ud.setValue(nil, forKey: User.name.rawValue)
        ud.setValue(nil, forKey: User.mail.rawValue)
        ud.setValue(nil, forKey: User.photo.rawValue)
    }
    static func save(_ value: String, for key: User) {
        let ud = UserDefaults.standard
        switch key {
        case .id:
            ud.setValue(value, forKey: key.rawValue)
        case .name:
            ud.setValue(value, forKey: key.rawValue)
        case .mail:
            ud.setValue(value, forKey: key.rawValue)
        case .photo:
            ud.setValue(value, forKey: key.rawValue)
        }
    }
    static func takeValue(for key: User) -> String? {
        let ud = UserDefaults.standard
        return ud.string(forKey: key.rawValue)
    }
}
