//
//  AALocalizationKit+Constants.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//


// MARK: - Constants
public let AALK = AALocalizationKit.shared

// MARK: - DefaultKeys for User Default keys
enum DefaultKeys: String {
    case selectedLanguageKey = "AALocalizationKitSelectedLanguage"
    case defaultLanguageKey = "AALocalizationKitDefaultLanguage"
    case unlocalizedKey = "<unlocalized>"
    
    /// Get the string value from user defaults for given key
    var get: String? {
        return UserDefaults.standard.string(forKey: rawValue)
    }
    
    /// Set the string value from user defaults for given key
    /// - Parameter value: New Value
    func set(value: AALanguage) {
        UserDefaults.standard.set(value.rawValue, forKey: rawValue)
    }
    
}


// MARK: - AALanguage for language codes
public enum AALanguage: String {
    case enGB = "en-GB"
    case enAU = "en-AU"
    case enCA = "en-CA"
    case enIN = "en-IN"
    case frCA = "fr-CA"
    case esMX = "es-MX"
    case ptBR = "pt-BR"
    case zhHans = "zh-Hans"
    case zhHant = "zh-Hant"
    case zhHK = "zh-HK"
    case es419 = "es-419"
    case ptPT = "pt-PT"
    case deviceLanguage
    case ar,en,nl,ja,ko,vi,ru,sv,fr,es,pt,it,de,da,fi,nb,tr,el,id,
           ms,th,hi,hu,pl,cs,sk,uk,hr,ca,ro,he,ur,fa,ku,arc,sl,ml
    
    
    /// Check the characters direction for current language
    var isRightToLeft: Bool {
        return Locale.characterDirection(forLanguage: rawValue) == .rightToLeft
    }
}
