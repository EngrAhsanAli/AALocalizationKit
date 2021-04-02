//
//  AALK+UIButton.swift
//  AALocalizationKit
//
//  Created by Muhammad Ahsan Ali on 2021/04/03.
//

import UIKit

// MARK: - UIButton extension for AALK
public extension UIButton {
    
    /// Set character direction for languages supporting left and right directions
    func aalk_setHorizontalAllignment() {
        guard contentHorizontalAlignment == .left || contentHorizontalAlignment == .right else { return }
        contentHorizontalAlignment = AALK.isRightToLeft ? .right : .left
    }
    
}
