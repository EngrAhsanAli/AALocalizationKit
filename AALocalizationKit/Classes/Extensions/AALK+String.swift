//
//  AALK+String.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

// MARK: - String extension for AALK
extension String {
    
    /// Return the localized string with empty comment
    @discardableResult
    mutating func localize() -> String {
        let localized = NSLocalizedString(self, comment: "")
        
        if localized == "" {
            return self
        }
        
        self = localized
        return localized
       
    }
    
}
