//
//  AALocalizationKit+UIFont.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

// MARK: - UIFont extension for AALK
extension UIFont {
    
    /// Gets the UIFont weight  from traits
    var weight: UIFont.Weight {
        guard let weightNumber = traits[.weight] as? NSNumber else { return .regular }
        let weightRawValue = CGFloat(weightNumber.doubleValue)
        let weight = UIFont.Weight(rawValue: weightRawValue)
        return weight
    }
    
    /// Gets the traits from font descriptor property of UIFont
    var traits: [UIFontDescriptor.TraitKey: Any] {
        return fontDescriptor.object(forKey: .traits) as? [UIFontDescriptor.TraitKey: Any]
            ?? [:]
    }
    
    // Setting it for better time complexity
    func font(withName name: String) -> UIFont {
        return UIFont(name: name, size: fontDescriptor.pointSize) ?? self
    }
    
    /// Get the provided language font
    /// Font files against font weights should be input while application starts
    /// This will consider the default font with regular font weight if no custom font was provided by the user
    var languageFont: UIFont {
        if let languageFont = AALK.configuration.languageFont[AALK.currentLanguage]  {
            if AALK.configuration.keepSameFont, let fontName = languageFont[.regular] {
                return font(withName: fontName)
            }
            else if let fontName = languageFont[weight] {
                return font(withName: fontName)
            }
        }
        return font(withName: AALK.configuration.defaultFont)
    }
    
    
}


public extension UIFont {
    
    class func aalkFontName(_ weight: UIFont.Weight) -> String {
        (AALK.languageFonts[AALK.currentLanguage]?[weight])!
    }
    
    func aalk_changeFont(_ weight: UIFont.Weight) -> UIFont {
        let fontName = UIFont.aalkFontName(weight)
        return UIFont(name: fontName, size: self.pointSize) ?? self
    }
    
}
