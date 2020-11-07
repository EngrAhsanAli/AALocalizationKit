//
//  AALK+Appearance.swift
//  AALocalizationKit
//
//  Created by Muhammad Ahsan Ali on 2020/11/07.
//

import UIKit

public extension AALocalizationKit {
    
    func setLabelApperance(in container: [UIAppearanceContainer.Type]) {
        guard configuration.updateLabel else {
            return
        }
        if container.isEmpty {
            UILabel.appearance(whenContainedInInstancesOf: container).changeDefaultFont = true
        } else {
            UILabel.appearance().changeDefaultFont = true
        }
    }
    
    func setTextFieldApperance(in container: [UIAppearanceContainer.Type]) {
        guard configuration.updateTextField else {
            return
        }
        if container.isEmpty {
            UITextField.appearance(whenContainedInInstancesOf: container).changeDefaultFont = true
        } else {
            UITextField.appearance().changeDefaultFont = true
        }
    }
    
    func setButtonApperance(in container: [UIAppearanceContainer.Type]) {
        guard configuration.updateButton else {
            return
        }
        if container.isEmpty {
            UIButton.appearance(whenContainedInInstancesOf: container).changeDefaultFont = true
        } else {
            UIButton.appearance().changeDefaultFont = true
        }
    }
    
    func setTextViewApperance(in container: [UIAppearanceContainer.Type]) {
        guard configuration.updateTextView else {
            return
        }
        if container.isEmpty {
            UITextView.appearance(whenContainedInInstancesOf: container).changeDefaultFont = true
        } else {
            UITextView.appearance().changeDefaultFont = true
        }
    }
    
    func setSegmentedControlApperance(in container: [UIAppearanceContainer.Type]) {
        guard configuration.updateSegmentedControl else {
            return
        }
        if container.isEmpty {
            UISegmentedControl.appearance(whenContainedInInstancesOf: container).changeDefaultFont = true
        } else {
            UISegmentedControl.appearance().changeDefaultFont = true
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
    
    @objc var changeDefaultFont: Bool {
        get {
            fatalError()
        }
        set {
            guard newValue, AALK.configuration.shouldOverrideFont(font?.fontName) else { return }
            self.font = self.font.languageFont
        }
    }
}

extension UITextField {
    
    @objc var changeDefaultFont: Bool {
        get {
            fatalError()
        }
        set {
            guard newValue, AALK.configuration.shouldOverrideFont(font?.fontName) else { return }
            font = font?.languageFont
            textAlignment.setAllignment()
            placeholder?.localize()
            text?.localize()
            
        }
    }
}

extension UIButton {
    
    @objc var changeDefaultFont: Bool {
        get {
            fatalError()
        }
        set {
            guard newValue else { return }
            if let titleLabel = titleLabel, let text = titleLabel.text?.localize(),  AALK.configuration.shouldOverrideFont(titleLabel.font.fontName) {
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
    
    @objc var changeDefaultFont: Bool {
        get {
            fatalError()
        }
        set {
            guard newValue, AALK.configuration.shouldOverrideFont(font?.fontName) else { return }
            font = font?.languageFont
            textAlignment.setAllignment()
            text?.localize()
        }
    }
}

extension UISegmentedControl {
    
    @objc var changeDefaultFont: Bool {
        get {
            fatalError()
        }
        set {
            guard newValue, AALK.configuration.shouldOverrideFont(nil) else { return }
            let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: AALK.configuration.sizeSegmentedControl).languageFont]
            setTitleTextAttributes(attrs, for: .normal)
            setTitleTextAttributes(attrs, for: .selected)
        }
    }
}
