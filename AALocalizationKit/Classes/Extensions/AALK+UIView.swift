//
//  AALocalizationKit+UIView.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

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
    
    /// Localize method to swizzle the selector
    static func localize() {
        
        let orginalSelector = #selector(awakeFromNib)
        let swizzledSelector = #selector(swizzledAwakeFromNib)
        
        let orginalMethod = class_getInstanceMethod(self, orginalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, orginalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(orginalMethod!), method_getTypeEncoding(orginalMethod!))
        } else {
            method_exchangeImplementations(orginalMethod!, swizzledMethod!)
        }
        
    }
    
    @objc func swizzledAwakeFromNib() {
        updateLocalization()
    }
    
    func updateLocalization() {
        let config = AALK.configuration
        
        switch self {
        case let _view as UITextField
            where config.updateTextField:
            
            _view.font = _view.font?.languageFont
            _view.textAlignment.setAllignment()
            _view.placeholder?.localize()
            _view.text?.localize()
            
        case let _view as UILabel
            where config.updateLabel:
            
            _view.font = _view.font?.languageFont
            _view.textAlignment.setAllignment()
            _view.text?.localize()
            
        case let _view as UIButton
            where config.updateButton:
            
            if let titleLabel = _view.titleLabel, let text = titleLabel.text?.localize() {
                titleLabel.textAlignment.setAllignment()
                titleLabel.font = titleLabel.font?.languageFont
                
                _view.setTitle(text, for: .normal)
                _view.setTitle(text, for: .selected)
                _view.setAllignment()
            }
            
        case let _view as UITextView
            where config.updateTextView:
            
            _view.font = _view.font?.languageFont
            _view.textAlignment.setAllignment()
            _view.text?.localize()
            
        case let _view as UISegmentedControl
            where config.updateSegmentedControl:
            
            let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: AALK.configuration.sizeSegmentedControl).languageFont]
            _view.setTitleTextAttributes(attrs, for: .normal)
            _view.setTitleTextAttributes(attrs, for: .selected)
           
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
