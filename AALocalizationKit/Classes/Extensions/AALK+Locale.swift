//
//  AALK+Locale.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

// MARK:- Locale for App
public extension Locale {
    
    /// Returns the language display name
    /// - Parameter identifier: language identifier
    static func aalk_languageName(from identifier: String) -> String {
        let locale = NSLocale(localeIdentifier: identifier)
        return locale.displayName(forKey: NSLocale.Key.identifier , value: identifier)!
    }
    
}
