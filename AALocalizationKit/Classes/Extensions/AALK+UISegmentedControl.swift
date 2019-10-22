//
//  UISegmentedControl.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

extension UISegmentedControl {
    func changeTitleFont(newFont: UIFont){
        let attributedSegmentFont = NSDictionary(object: newFont, forKey: NSAttributedString.Key.font as NSCopying)
        setTitleTextAttributes(attributedSegmentFont as? [NSAttributedString.Key : Any], for: .normal)
    }
}
