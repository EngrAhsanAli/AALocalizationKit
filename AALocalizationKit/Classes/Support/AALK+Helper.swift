//
//  AALK+Helper.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 16/11/2019.
//


extension AALanguage {
    
    var isLanguageRightToLeft: Bool {
        return Locale.characterDirection(forLanguage: rawValue) == .rightToLeft
    }
    
}


public extension Locale {
    
    static func aalk_language(from identifier: String) -> String {
        let locale = NSLocale(localeIdentifier: identifier)
        return locale.displayName(forKey: NSLocale.Key.identifier , value: identifier)!
    }
    
}

extension UserDefaults {
    
    class func aalk_get(withKey key: DefaultKeys) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    class func aalk_set(value: AALanguage, withKey key: DefaultKeys) {
        UserDefaults.standard.set(value.rawValue, forKey: key.rawValue)
    }
    
}
