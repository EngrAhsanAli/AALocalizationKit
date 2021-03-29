//
//  AALocalizationKit+UIFont.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
    
    
}


public extension UIFont {
    
    convenience init(aalk weight: UIFont.Weight, pointSize: CGFloat) {
        let fontName = UIFont.aalk_fontName(weight)
        self.init(name: fontName, size: pointSize)!
    }
    
    class func aalk_fontName(_ weight: UIFont.Weight) -> String {
        (AALK.languageFonts[AALK.currentLanguage]?[weight]) ?? "Helvetica"
    }
    
    func aalk_changeFont(_ weight: UIFont.Weight) -> UIFont {
        let fontName = UIFont.aalk_fontName(weight)
        return UIFont(name: fontName, size: pointSize) ?? self
    }
    
}
