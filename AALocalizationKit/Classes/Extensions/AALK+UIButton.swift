//
//  AALK+UIButton.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import Foundation

// MARK: - UIButton extension for AALK
extension UIButton {
    
    /// Set button allignment if language supports right ot left direction
    func setAllignment() {
        guard contentHorizontalAlignment == .left || contentHorizontalAlignment == .right else { return }
        contentHorizontalAlignment = AALK.isRightToLeft ? .right : .left
    }
    
    /// Set the respective button localized title against button state
    /// - Parameter state: UIControl state
    func setLocalizedTitle(_ states: [UIControl.State]) {
        states.forEach {
            if var text = title(for: $0) {
                setTitle(text.localize(), for: $0)
            }                   
        }
    }
    
}
