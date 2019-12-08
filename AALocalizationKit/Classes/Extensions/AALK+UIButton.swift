//
//  AALK+UIButton.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

// MARK: - UIButton extension

extension UIButton {
    
    func setHorizontalAllignment() {
        guard contentHorizontalAlignment == .left || contentHorizontalAlignment == .right else { return }
        contentHorizontalAlignment = AALK.isRightToLeft ? .left : .right
    }
    
}
