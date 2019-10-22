//
//  AALocalizationKit+NSLocale.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

extension NSLocale {
    
    class func getLangName(identifier: String) -> String {
        let locale = NSLocale(localeIdentifier: identifier)
        return locale.displayName(forKey: NSLocale.Key.identifier , value: identifier)!
    }
    
}
