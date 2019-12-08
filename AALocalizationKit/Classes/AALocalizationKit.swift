//
//  AALocalizationKit.swift
//  AALocalizationKit
//
//  Created by Ahsan Ali on 11/06/2019.
//  Copyright © 2019 AA Creations. All rights reserved.
//

import UIKit

// MARK:- AALocalizationKit
public class AALocalizationKit {
    
    public static let shared: AALocalizationKit = AALocalizationKit()
    
    public var localizedView: ((UIView) -> ())?
            
    public var configuration = AALK_Configuration()
    
    init() {
        let langCode = Locale.current.languageCode ?? "en"
        defaultLanguage = AALanguage(rawValue: langCode) ?? .en
    }
    
    public var currentLanguage: AALanguage {
        get {
            
            guard let currentLang = UserDefaults.aalk_get(withKey: .selectedLanguageKey) else {
                fatalError("AALocalizationKit:- Did you set the default language for the app ?")
            }
            return AALanguage(rawValue: currentLang)!
        }
        set {
            UserDefaults.aalk_set(value: newValue, withKey: .selectedLanguageKey)
            
            let semanticContentAttribute: UISemanticContentAttribute = newValue.isLanguageRightToLeft ? .forceRightToLeft : .forceLeftToRight
            UIView.appearance().semanticContentAttribute = semanticContentAttribute

        }
    }
    
    public var defaultLanguage: AALanguage {
        get {
            guard let defaultLanguage = UserDefaults.aalk_get(withKey: .defaultLanguageKey)else {
                fatalError("AALocalizationKit:- Did you set the default language for the app ?")
            }
            return AALanguage(rawValue: defaultLanguage)!
        }
        set {
            if UserDefaults.aalk_get(withKey: .defaultLanguageKey) == nil {
                
                UserDefaults.aalk_set(value: newValue, withKey: .defaultLanguageKey)
                UserDefaults.aalk_set(value: newValue, withKey: .selectedLanguageKey)
                
                currentLanguage = newValue
            }
            
            UIView.localize()
            Bundle.localize()
            
        }
    }
    
    public var isRightToLeft: Bool {
        return currentLanguage.isLanguageRightToLeft
    }
    
    public var appLocale: Locale {
        return Locale(identifier: currentLanguage.rawValue)
    }
    
    public var availableLanguages: [String] {
        var languages = Bundle.main.localizations
        if let indexOfBase = languages.firstIndex(of: "Base") {
            languages.remove(at: indexOfBase)
        }
        return languages
    }
    
}

