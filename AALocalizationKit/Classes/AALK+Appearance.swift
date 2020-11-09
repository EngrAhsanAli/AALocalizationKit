//
//  AALK+Appearance.swift
//  AALocalizationKit
//
//  Created by Muhammad Ahsan Ali on 2020/11/07.
//

import UIKit

public extension AALocalizationKit {
    
    func setLabelApperance(in container: [UIAppearanceContainer.Type]) {
        guard AALK.configuration.updateLabel else {
            return
        }
        if container.count > 0 {
            UILabel.appearance(whenContainedInInstancesOf: container).changeDefaultFont = AALK.configuration
        } else {
            UILabel.appearance().changeDefaultFont = AALK.configuration
        }
    }
    
    func setTextFieldApperance(in container: [UIAppearanceContainer.Type]) {
        guard AALK.configuration.updateTextField else {
            return
        }
        if container.count > 0 {
            UITextField.appearance(whenContainedInInstancesOf: container).changeDefaultFont = AALK.configuration
        } else {
            UITextField.appearance().changeDefaultFont = AALK.configuration
        }
    }
    
    func setButtonApperance(in container: [UIAppearanceContainer.Type]) {
        guard AALK.configuration.updateButton else {
            return
        }
        if container.count > 0 {
            UIButton.appearance(whenContainedInInstancesOf: container).changeDefaultFont = AALK.configuration
        } else {
            UIButton.appearance().changeDefaultFont = AALK.configuration
        }
    }
    
    func setTextViewApperance(in container: [UIAppearanceContainer.Type]) {
        guard AALK.configuration.updateTextView else {
            return
        }
        if container.count > 0 {
            UITextView.appearance(whenContainedInInstancesOf: container).changeDefaultFont = AALK.configuration
        } else {
            UITextView.appearance().changeDefaultFont = AALK.configuration
        }
    }
    
    func setSegmentedControlApperance(in container: [UIAppearanceContainer.Type]) {
        guard AALK.configuration.updateSegmentedControl else {
            return
        }
        if container.count > 0 {
            UISegmentedControl.appearance(whenContainedInInstancesOf: container).changeDefaultFont = AALK.configuration
        } else {
            UISegmentedControl.appearance().changeDefaultFont = AALK.configuration
        }
    }
    
    func setApperance(_ container: [UIAppearanceContainer.Type] = []) {
        setLabelApperance(in: container)
        setTextFieldApperance(in: container)
        setButtonApperance(in: container)
        setTextViewApperance(in: container)
        setSegmentedControlApperance(in: container)
    }
}

extension UILabel {
    
    @objc var changeDefaultFont: Any {
        get {
            fatalError()
        }
        set {
            guard let config = newValue as? AALK_Configuration, config.updateLabel else { return }
            
            if let name = font?.fontName, config.exceptions.contains(name) {
                self.font = font?.font(withName: name)
                return
            }
            
            self.font = self.font?.languageFont
        }
    }
}

extension UITextField {
    
    @objc var changeDefaultFont: Any {
        get {
            fatalError()
        }
        set {
            guard let config = newValue as? AALK_Configuration, config.updateTextField else { return }

            if let name = font?.fontName, config.exceptions.contains(name) {
                self.font = font?.font(withName: name)
                return
            }
            
            font = font?.languageFont
            textAlignment.setAllignment()
            placeholder?.localize()
            text?.localize()
            
        }
    }
}

extension UIButton {
    
    @objc var changeDefaultFont: Any {
        get {
            fatalError()
        }
        set {
            guard let config = newValue as? AALK_Configuration, config.updateButton else { return }

            if let font = titleLabel?.font, config.exceptions.contains(font.fontName) {
                titleLabel!.font = font.font(withName: font.fontName)
                return
            }
            
            if let titleLabel = titleLabel, let text = titleLabel.text?.localize() {
                titleLabel.textAlignment.setAllignment()
                titleLabel.font = titleLabel.font?.languageFont
                
                setTitle(text, for: .normal)
                setTitle(text, for: .selected)
                setAllignment()
            }
        }
    }
}

extension UITextView {
    
    @objc var changeDefaultFont: Any {
        get {
            fatalError()
        }
        set {
            guard let config = newValue as? AALK_Configuration, config.updateTextView else { return }

            if let name = font?.fontName, config.exceptions.contains(name) {
                self.font = font?.font(withName: name)
                return
            }
            
            font = font?.languageFont
            textAlignment.setAllignment()
            text?.localize()
        }
    }
}

extension UISegmentedControl {
    
    @objc var changeDefaultFont: Any {
        get {
            fatalError()
        }
        set {
            guard let config = newValue as? AALK_Configuration, config.updateSegmentedControl else { return }

            let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: config.sizeSegmentedControl).languageFont]
            setTitleTextAttributes(attrs, for: .normal)
            setTitleTextAttributes(attrs, for: .selected)
        }
    }
}
