//
//  AALK+UIButton.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

extension UIButton {
    
    func setHorizontalAllignment() {
        guard contentHorizontalAlignment == .left || contentHorizontalAlignment == .right else { return }
        contentHorizontalAlignment = AALocalizationKit.shared.isRightToLeft ? .left : .right
    }
    
}
