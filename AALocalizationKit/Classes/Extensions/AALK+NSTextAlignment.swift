//
//  AALK+NSTextAlignment.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

// MARK: - NSTextAlignment extension

extension NSTextAlignment {
    
    /// <#Description#>
    mutating func setDirection() {
        guard self == .left || self == .right else { return }
        if AALK.isRightToLeft {
            self = self == .left ? .right : .left
        }
    }
}
