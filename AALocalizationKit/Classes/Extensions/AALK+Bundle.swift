//
//  AALK+Bundle.swift
//  AALocalizationKit
//
//  Created by Muhammad Ahsan Ali on 2021/04/03.
//

import Foundation

public extension Bundle {
    
    /// Find translations from given bundle and current language
    /// - Parameter fileName: local strings fileName
    /// - Returns: Dictionary of localizations
    func aalk_findLocalization(fileName: String,
                               withExtension: String = "strings") -> [String: String] {
        let fileName = "\(fileName)\(AALK.currentLanguage.rawValue)"
        let localizedPath = url(forResource: fileName, withExtension: withExtension)!
        return NSDictionary(contentsOf: localizedPath)! as! [String : String]
    }
    
}
