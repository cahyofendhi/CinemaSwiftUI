//
//  Session.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 03/02/22.
//

import Foundation

enum SessionKeys: String, CaseIterable {
    case isLogin
    case isIntro
}

final class SessionData {
    
    static func setData<T>(value: T, key: SessionKeys) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    
    static func getData<T>(type: T.Type, forKey: SessionKeys) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }
    
    static func removeData(key: SessionKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
    
}
