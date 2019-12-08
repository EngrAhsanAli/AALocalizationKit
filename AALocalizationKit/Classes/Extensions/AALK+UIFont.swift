//
//  AALocalizationKit+UIFont.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

// MARK: - UIFont extension

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
    
    /// Get the provided language font
    ///
    
    var languageFont: UIFont {
        if let languageFont = AALK.configuration.languageFont[AALK.currentLanguage]  {
            if AALK.configuration.keepSameFont, let fontName = languageFont[.regular] {
                return aalk_font(withName: fontName)
            }
            else if let fontName = languageFont[weight] {
                return aalk_font(withName: fontName)
            }
        }
        return aalk_font(withName: AALK.configuration.defaultFont)
    }
    
    
    // Setting it for better time complexity
    func aalk_font(withName name: String) -> UIFont {
        return UIFont(name: name, size: fontDescriptor.pointSize) ?? self
    }
    
}


