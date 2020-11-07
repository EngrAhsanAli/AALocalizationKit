//
//  AALocalizationKit+UIView.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// Flag to make change of fonts
fileprivate var enableFontChange: Bool = false

// MARK: - IBDesignable UIView for App
@IBDesignable
public extension UIView {
    
    /// Change the view direction to flip for characters direction is right to left
    @IBInspectable var AAViewDirection: Bool {
        set {
            guard AALK.isRightToLeft else { return }
            transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        get {
            fatalError()
        }
    }
}


// MARK: - Swizzling UIView for localization for AALK
extension UIView {
    
    /// Start localize method to swizzle the selector
    static func startFontChange() {
        guard !enableFontChange else {
            print("AALocalizationKit:- Font change already enabled")
            return
        }
        let orginalSelector = #selector(awakeFromNib)
        let swizzledSelector = #selector(swizzledAwakeFromNib)
        let orginalMethod = class_getInstanceMethod(self, orginalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(orginalMethod!, swizzledMethod!)
        enableFontChange = true
    }
    
    /// Stop localize method to swizzle the selector
    static func stopFontChange() {
        guard enableFontChange else {
            print("AALocalizationKit:- Font change is not enabled yet")
            return
        }
        
        let orginalSelector = #selector(awakeFromNib)
        let swizzledSelector = #selector(swizzledAwakeFromNib)
        let orginalMethod = class_getInstanceMethod(self, orginalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(swizzledMethod!, orginalMethod!)
        enableFontChange = false
    }
    
    @objc func swizzledAwakeFromNib() {
        updateLocalization()
    }
    
    func updateLocalization() {
        let config = AALK.configuration
        
        switch self {
        case let _view as UITextField
            where config.updateTextField:
            _view.changeDefaultFont = true
            
        case let _view as UILabel
            where config.updateLabel:
            _view.changeDefaultFont = true
            
        case let _view as UIButton
            where config.updateButton:
            _view.changeDefaultFont = true
            
        case let _view as UITextView
            where config.updateTextView:
            _view.changeDefaultFont = true
            
        case let _view as UISegmentedControl
            where config.updateSegmentedControl:
            _view.changeDefaultFont = true
           
        default:
            break
        }
        
        // Callback for respective view to localize
        AALK.localizedView?(self)
        
    }
    
    func aa_findViews<T: UIView>(subclassOf: T.Type) -> [T] {
        return aa_recursiveSubviews.compactMap { $0 as? T }
    }
    var aa_recursiveSubviews: [UIView] {
        return subviews + subviews.flatMap { $0.aa_recursiveSubviews }
    }
}


public extension UIView {
    
    
    func aa_updateLocalization(recursive flag: Bool = true) {
        if flag {
            let allSubViews = aa_recursiveSubviews
            if allSubViews.count > 0 {
                allSubViews.forEach {
                    $0.updateLocalization()
                }
                return
            }
            
        }
        updateLocalization()
    }
}
