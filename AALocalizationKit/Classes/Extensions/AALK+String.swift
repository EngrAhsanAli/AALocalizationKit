//
//  AALocalizationKit+String.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

// MARK: - String extension

extension String {
    
    func replace(_ originalString: String, with newString: String) -> String {
        return self.replacingOccurrences(of: originalString, with: newString)
    }
    
    public func localiz(comment: String = "") -> String {
        let localized = NSLocalizedString(self, comment: comment)
        if localized == "" {
            return self
        }
        return localized
    }
    
    var fontFamily: String? {
        guard let index = firstIndex(of: "-") else { return nil }
        return String(prefix(upTo: index))
    }
    
}











