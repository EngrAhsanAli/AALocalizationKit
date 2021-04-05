//
//  AALK+Configuration.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

// MARK:- AALK_Configuration
@objc public class AALK_Configuration: NSObject {
    public override init() {}
        
    @objc public class UpdateOptions: NSObject {
        public var font: Bool = true
        public var alignment: Bool = true
        public var localize: Bool = true
        public var container: [UIAppearanceContainer.Type] = []
    }
    
    public enum UI_Elems {
        case label(UpdateOptions),
             searchField(UpdateOptions),
             textField(UpdateOptions),
             textView(UpdateOptions),
             button(UpdateOptions),
             segmentedControl(UpdateOptions)
    }
    
    /// Default font family for default language of the application
    public var defaultFont: String = "GillSans"
    
    /// Fonts those should not override
    public var exceptions = Set<String>()
    
    /// Collection of languages and their respective font weights and font families
    public var languageFont: [AALanguage: [UIFont.Weight: String]] = [:]
    
    /// UISegmentedControl size
    public var sizeSegmentedControl: CGFloat = 25
    
    public var localizationBundle: Bundle = .main
    
    public var appearanceElements: [UI_Elems] = [.label(UpdateOptions()),
                                                 .button(UpdateOptions()),
                                                 .searchField(UpdateOptions()),
                                                 .textField(UpdateOptions()),
                                                 .textView(UpdateOptions())]
        
}

extension AALK_Configuration {
    
    func localizedString(_ key: String?) -> String? {
        guard let text = key,
              let bundlePath = localizationBundle.path(forResource: AALK.currentLanguageString, ofType: "lproj") else { return nil }
        let bundle = Bundle(path: bundlePath)!
        return bundle.localizedString(forKey: text, value: nil, table: nil)
    }
    
    /// Get the provided language font
    /// Font files against font weights should be input while application starts
    /// This will consider the default font with regular font weight if no custom font was provided by the user
    func setLanguageFont(_ font: UIFont?) -> UIFont? {
        guard let _font = font else { return nil }
        if let fontName = languageFont[AALK.currentLanguage]?[_font.weight] {
            if exceptions.contains(_font.fontName) {
                return _font
            }
            return _font.font(withName: fontName)
        }
        return _font.font(withName: defaultFont)
    }
    
}
