//
//  AALK+NSTextAlignment.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

// MARK: - NSTextAlignment extension for AALK
extension NSTextAlignment {
    
    /// Set character direction for languages supporting left and right directions
    mutating func setAllignment() {
        guard self == .left || self == .right else { return }
        self = AALK.isRightToLeft ? .right : .left
    }
}
