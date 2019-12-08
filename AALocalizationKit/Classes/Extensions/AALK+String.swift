//
//  AALocalizationKit+String.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

// MARK: - String extension

extension String {
    
    /// <#Description#>
    /// - Parameter comment: <#comment description#>
    public func aa_localize(comment: String = "") -> String {
        let localized = NSLocalizedString(self, comment: comment)
        if localized == "" {
            return self
        }
        return localized
    }
    
}
