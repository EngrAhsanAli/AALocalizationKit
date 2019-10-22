//
//  AALocalizationKit+Constants.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

// MARK: - Constants

enum Constant: String {
    case selectedLanguageKey = "AALocalizationKitSelectedLanguage"
    case defaultLanguageKey = "AALocalizationKitDefaultLanguage"
    case unlocalizedKey = "<unlocalized>"

}

public enum FontTypes: String {
    case regular = "Regular"
    case medium = "Medium"
    case bold = "Bold"
}

// MARK: - Languages

public enum Languages: String {
    case ar,en
}
