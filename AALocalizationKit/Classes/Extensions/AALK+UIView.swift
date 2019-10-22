//
//  AALocalizationKit+UIView.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

@IBDesignable
public extension UIView {
    @IBInspectable var ViewDirection: Bool {
        set {
            if AALocalizationKit.shared.isRightToLeft { // CHANGE NOW
                transform = CGAffineTransform(scaleX: -1, y: 1)
            }
        }
        get {
            fatalError()
        }
    }
}


// MARK: - Swizzling

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
        switch self {
        case let _view as UITextField:
            if let font = _view.font?.languageFont {
                _view.font = font
            }
            _view.textAlignment.setDirection()
            _view.placeholder = _view.placeholder?.localiz()
            _view.text = _view.text?.localiz()
        case let _view as UILabel:
            if let font = _view.font?.languageFont {
                _view.font = font
            }
            _view.textAlignment.setDirection()
            _view.text = _view.text?.localiz()
        case let _view as UIButton:
            if let titleLabel = _view.titleLabel {
                titleLabel.textAlignment.setDirection()
                if let font = titleLabel.font?.languageFont {
                    titleLabel.font = font
                }
            }
            _view.setHorizontalAllignment()
            _view.setTitle(_view.title(for: .normal)?.localiz(), for: .normal)
        case let _view as UITextView:
            if let font = _view.font?.languageFont {
                _view.font = font
            }
            _view.textAlignment.setDirection()
            _view.text = _view.text?.localiz()
        case let _view as UISegmentedControl:
            (0 ..< _view.numberOfSegments).forEach { _view.setTitle(_view.titleForSegment(at: $0)?.localiz(), forSegmentAt: $0) }
            
            var defaultFont =  UIFont(name: AALocalizationKit.shared.deafultFontName, size: 15)!
            if let font = defaultFont.languageFont {
                defaultFont = font
            }
            _view.changeTitleFont(newFont: defaultFont)
        default:
            break
        }
    }
    
}

