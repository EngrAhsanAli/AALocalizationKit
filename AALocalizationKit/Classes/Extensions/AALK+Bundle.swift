//
//  AALK+Bundle.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// Flag to auto localize the strings if available
fileprivate var enableLocalization: Bool = false

// MARK: - Bundle extension for AALK
extension Bundle {
    
    /// Localize method to swizzle the selector 
    static func startLocalization() {
        guard !enableLocalization else {
            print("AALocalizationKit:- Localization of strings is already enabled")
            return
        }
        let orginalSelector = #selector(localizedString(forKey:value:table:))
        let swizzledSelector = #selector(aa_localizedString(forKey:value:table:))
        let orginalMethod = class_getInstanceMethod(self, orginalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(orginalMethod!, swizzledMethod!)
        enableLocalization = true
    }
    
    static func stopLocalization() {
        guard enableLocalization else {
            print("AALocalizationKit:- Localization of strings is not enabled yet")
            return
        }
        
        let orginalSelector = #selector(localizedString(forKey:value:table:))
        let swizzledSelector = #selector(aa_localizedString(forKey:value:table:))
        let orginalMethod = class_getInstanceMethod(self, orginalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(orginalMethod!, swizzledMethod!)
        enableLocalization = false
        
    }
    
    /// Swizzled method to localize the strings found in the bundle
    /// - Parameters:
    ///   - key: key string
    ///   - value: value string
    ///   - table: table string
    @objc fileprivate func aa_localizedString(forKey key: String,
                                             value: String?,
                                             table: String?) -> String {
        if let bundle = Bundle.main.path(forResource: AALK.currentLanguage.rawValue, ofType: "lproj"), let langBundle = Bundle(path: bundle) {
            
            let text = langBundle.aa_localizedString(forKey: key, value: value, table: table)
            if text == DefaultKeys.unlocalizedKey.rawValue {
                return key
            }
            return langBundle.aa_localizedString(forKey: key, value: value, table: table)
        } else {
            return Bundle.main.aa_localizedString(forKey: key, value: value, table: table)
        }
    }
}
