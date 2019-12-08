//
//  AALK+Configuration.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 08/12/2019.
//

public struct AALK_Configuration {
    
    public var defaultFont: String = "GillSans"
    public var keepSameFont: Bool = true
    public var languageFont: [AALanguage: [UIFont.Weight: String]] = [:]
    public var sizeSegmentedControl: CGFloat = 16
    public var updateSegmentedControl: Bool = true
    public var updateTextField: Bool = true
    public var updateLabel: Bool = true
    public var updateTextView: Bool = true
    public var updateButton: Bool = true

}
