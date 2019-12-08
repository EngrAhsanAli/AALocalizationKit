//
//  AALK+Bundle.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

// MARK: - Bundle extension

extension Bundle {
    
    /// <#Description#>
    static func localize() {
        
        let orginalSelector = #selector(localizedString(forKey:value:table:))
        let swizzledSelector = #selector(aa_localizedString(forKey:value:table:))
        
        let orginalMethod = class_getInstanceMethod(self, orginalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, orginalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(orginalMethod!), method_getTypeEncoding(orginalMethod!))
        } else {
            method_exchangeImplementations(orginalMethod!, swizzledMethod!)
        }
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - key: <#key description#>
    ///   - value: <#value description#>
    ///   - table: <#table description#>
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
