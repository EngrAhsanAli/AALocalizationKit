//
//  AALK+Bundle.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

extension Bundle {
    static func localize() {
        
        let orginalSelector = #selector(localizedString(forKey:value:table:))
        let swizzledSelector = #selector(customLocaLizedString(forKey:value:table:))
        
        let orginalMethod = class_getInstanceMethod(self, orginalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, orginalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(orginalMethod!), method_getTypeEncoding(orginalMethod!))
        } else {
            method_exchangeImplementations(orginalMethod!, swizzledMethod!)
        }
    }
    
    @objc private func customLocaLizedString(forKey key: String,
                                             value: String?,
                                             table: String?) -> String {
        if let bundle = Bundle.main.path(forResource: AALocalizationKit.shared.currentLanguage.rawValue, ofType: "lproj"), let langBundle = Bundle(path: bundle) {
            
            let text = langBundle.customLocaLizedString(forKey: key, value: value, table: table)
            if text == Constant.unlocalizedKey.rawValue {
                return key
            }
            return langBundle.customLocaLizedString(forKey: key, value: value, table: table)
        } else {
            return Bundle.main.customLocaLizedString(forKey: key, value: value, table: table)
        }
    }
}
