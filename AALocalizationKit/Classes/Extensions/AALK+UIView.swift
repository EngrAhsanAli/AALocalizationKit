//
//  AALocalizationKit+UIView.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

@IBDesignable
public extension UIView {
    @IBInspectable var AAViewDirection: Bool {
        set {
            if AALK.isRightToLeft {
                transform = CGAffineTransform(scaleX: -1, y: 1)
            }
        }
        get {
            fatalError()
        }
    }
}


// MARK: - Swizzling UIView for localization

extension UIView {
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
        let config = AALK.configuration
        switch self {
        case let _view as UITextField where config.updateTextField:
            _view.font = _view.font?.languageFont
            _view.textAlignment.setDirection()
            _view.placeholder = _view.placeholder?.aa_localize()
            _view.text = _view.text?.aa_localize()
        case let _view as UILabel where config.updateLabel:
            _view.font = _view.font?.languageFont
            _view.textAlignment.setDirection()
            _view.text = _view.text?.aa_localize()
        case let _view as UIButton where config.updateButton:
            if let titleLabel = _view.titleLabel {
                titleLabel.textAlignment.setDirection()
                titleLabel.font = titleLabel.font?.languageFont
            }
            _view.setHorizontalAllignment()
            _view.setTitle(_view.title(for: .normal)?.aa_localize(), for: .normal)
        case let _view as UITextView where config.updateTextView:
            _view.font = _view.font?.languageFont
            _view.textAlignment.setDirection()
            _view.text = _view.text?.aa_localize()
        case let _view as UISegmentedControl where config.updateSegmentedControl:
            let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: AALK.configuration.sizeSegmentedControl).languageFont]
            _view.setTitleTextAttributes(attrs, for: .normal)
            _view.setTitleTextAttributes(attrs, for: .selected)
           
        default:
            break
        }
        AALK.localizedView?(self)
    }
    
}

