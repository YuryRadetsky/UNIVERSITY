//
//  UserSettings.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 08.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import Foundation

final class UserSettings {
    // enum, который будет хранить ключи
     enum SettingsKeys: String {
        case userName
        case password
    }
    
    static var userName: String! {
        get {
            // достаем значение из UserDefaults
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            // получаем новое значение
            if let username = newValue {
                print("Login: \(username) was added to key \(key)")
                defaults.set(username, forKey: key)
                
            } else {
                // если не получилось достать новое значение (nil), удаляем у объекта defaults по ключу key
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var password: String! {
        get {
            // достаем значение из UserDefaults
            return UserDefaults.standard.string(forKey: SettingsKeys.password.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.password.rawValue
            if let password = newValue {
                print("Password: \(password) was added to key \(key)")
                defaults.set(password, forKey: key)
            } else {
                // если не получилось достать новое значение (nil), удаляем у объекта defaults по ключу key
                defaults.removeObject(forKey: key)
            }
        }
    }
    
}
