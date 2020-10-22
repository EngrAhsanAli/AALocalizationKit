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
    
    
    /// Configs localization with given font names and weights
    /// - Parameter fonts: array of fonts with names
    static func aalk_configure(_ fonts: [String : [UIFont.Weight : String]]) {
        var aalkFonts = [AALanguage : [UIFont.Weight : String]]()
        for (key, value) in fonts {
            if let lang = AALanguage(rawValue: key) {
                aalkFonts[lang] = value
            }
            else {
                fatalError("AALocalization:- The names of the fonts are not in correct format. Font family and weight must seperate from -")
            }
        }
        
        if let fontFamily = aalkFonts.first!.key.rawValue.components(separatedBy: "-").first {
            AALK.configuration.defaultFont = fontFamily
        }
        AALK.configuration.languageFont = aalkFonts
        
    }
}
