//
//  AALK+NSTextAlignment.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

extension NSTextAlignment {
    mutating func setDirection() {
        guard self == .left || self == .right else { return }
        if AALocalizationKit.shared.isRightToLeft { // CHANGE NOW
            self = self == .left ? .right : .left
        }
    }
}
