//
//  AALocalizationKit+UIFont.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

extension UIFont {
    
    var languageFont: UIFont? {
        return AALocalizationKit.shared.customFonts?.filter({ (arg0) -> Bool in
            let (key, _) = arg0
            return key == AALocalizationKit.shared.currentLanguage
        }).map ({ (key, value) -> UIFont? in
            guard let name = fontDescriptor.fontAttributes[.name] as? String, let size = fontDescriptor.fontAttributes[.size] as? CGFloat else {
                return nil
            }
            let _name = name.fontFamily ?? name
            if _name != value {
                let fontName = name.replace(_name, with: value)
                return UIFont(name: fontName, size: size)
            }
            return nil
        }).first ?? nil
    }
}
