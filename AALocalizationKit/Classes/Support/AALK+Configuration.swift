//
//  AALK+Configuration.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

// MARK:- AALK_Configuration
public struct AALK_Configuration {
    
    /// Default font family for default language of the application
    public var defaultFont: String = "GillSans"
    
    /// Fonts those should not override
    public var exceptions: [String] = []

    /// Flag to keep same font family if no respective font weight found in the application
    public var keepSameFont: Bool = true
    
    /// Collection of languages and their respective font weights and font families
    public var languageFont: [AALanguage: [UIFont.Weight: String]] = [:]
    
    /// UISegmentedControl size
    public var sizeSegmentedControl: CGFloat = 17
    
    /// UISegmentedControl flag to update when language changes
    public var updateSegmentedControl: Bool = true
    
    /// UITextField flag to update when language changes
    public var updateTextField: Bool = true
    
    /// UILabel flag to update when language changes
    public var updateLabel: Bool = true
    
    /// UITextView flag to update when language changes
    public var updateTextView: Bool = true
    
    /// UIButton flag to update when language changes
    public var updateButton: Bool = true

}

extension AALK_Configuration {
    
    func shouldOverrideFont(_ name: String?) -> Bool {
        guard let name = name else {
            return true
        }
        return !exceptions.contains(name)
    }
    
}
