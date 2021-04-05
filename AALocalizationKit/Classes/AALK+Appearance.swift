//
//  AALK+Appearance.swift
//  AALocalizationKit
//
//  Created by Muhammad Ahsan Ali on 2020/11/07.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

extension AALocalizationKit {
    
    func setLabelApperance(of appearance: AALK_Configuration.UpdateOptions) {
        let config = configuration
        let container = appearance.container
        let instance = (container.count > 0) ?
            UILabel.appearance(whenContainedInInstancesOf: container) :
            UILabel.appearance()
        
        if appearance.alignment { instance.aalkChangeAllignment = config }
        if appearance.font { instance.aalkChangeFont = config }
        if appearance.localize { instance.aalkChangeText = config }
        
    }
    
    func setTextFieldApperance(of appearance: AALK_Configuration.UpdateOptions) {
        let config = configuration
        let container = appearance.container
        let instance = (container.count > 0) ?
            UITextField.appearance(whenContainedInInstancesOf: container) :
            UITextField.appearance()
        
        if appearance.alignment { instance.aalkChangeAllignment = config }
        if appearance.font { instance.aalkChangeFont = config }
        if appearance.localize { instance.aalkChangeText = config }
        
    }
    
    func setSearchFieldApperance(of appearance: AALK_Configuration.UpdateOptions) {
        let config = configuration
        let container = appearance.container
        let instance = (container.count > 0) ?
            UISearchBar.appearance(whenContainedInInstancesOf: container) :
            UISearchBar.appearance()
        
        if appearance.alignment { instance.aalkChangeAllignment = config }
        if appearance.font { instance.aalkChangeFont = config }
        if appearance.localize { instance.aalkChangeText = config }
        
    }
    
    func setButtonApperance(of appearance: AALK_Configuration.UpdateOptions) {
        let config = configuration
        let container = appearance.container
        let instance = (container.count > 0) ?
            UIButton.appearance(whenContainedInInstancesOf: container) :
            UIButton.appearance()
        
        if appearance.alignment { instance.aalkChangeAllignment = config }
        if appearance.font { instance.aalkChangeFont = config }
        if appearance.localize { instance.aalkChangeText = config }
        
    }
    
    func setTextViewApperance(of appearance: AALK_Configuration.UpdateOptions) {
        let config = configuration
        let container = appearance.container
        let instance = (container.count > 0) ?
            UITextView.appearance(whenContainedInInstancesOf: container) :
            UITextView.appearance()
        
        if appearance.alignment { instance.aalkChangeAllignment = config }
        if appearance.font { instance.aalkChangeFont = config }
        if appearance.localize { instance.aalkChangeText = config }
        
    }
    
    func setSegmentedControlApperance(of appearance: AALK_Configuration.UpdateOptions) {
        let config = configuration
        let container = appearance.container
        let instance = (container.count > 0) ?
            UISegmentedControl.appearance(whenContainedInInstancesOf: container) :
            UISegmentedControl.appearance()
        
        // if appearance.alignment { } // TODO
        if appearance.font { instance.aalkChangeFont = config }
        if appearance.localize { instance.aalkChangeText = config }
        
    }
    
}

fileprivate extension UILabel {
    
    @objc var aalkChangeAllignment: AALK_Configuration {
        get { fatalError() }
        set { textAlignment.aalk_setAllignment() }
    }
    
    @objc var aalkChangeText: AALK_Configuration {
        get { fatalError() }
        set {
            guard let text = newValue.localizedString(text) else { return }
            self.text = text
        }
    }
    
    @objc var aalkChangeFont: AALK_Configuration {
        get { fatalError() }
        set { font = newValue.setLanguageFont(font) }
    }
}

fileprivate extension UITextField {
    
    @objc var aalkChangeAllignment: AALK_Configuration {
        get { fatalError() }
        set { textAlignment.aalk_setAllignment() }
    }
    
    @objc var aalkChangeText: AALK_Configuration {
        get { fatalError() }
        set {
            if let text = newValue.localizedString(text) { self.text = text }
            if let placeholder = newValue.localizedString(placeholder) { self.placeholder = placeholder }
        }
    }
    
    @objc var aalkChangeFont: AALK_Configuration {
        get { fatalError() }
        set { font = newValue.setLanguageFont(font) }
    }
}

fileprivate extension UISearchBar {
    
    @objc var aalkChangeAllignment: AALK_Configuration {
        get { fatalError() }
        set { aa_textField.textAlignment.aalk_setAllignment() }
    }
    
    @objc var aalkChangeText: AALK_Configuration {
        get { fatalError() }
        set {
            if let text = newValue.localizedString(text) { self.text = text }
            if let placeholder = newValue.localizedString(placeholder) { self.placeholder = placeholder }
        }
    }
    
    @objc var aalkChangeFont: AALK_Configuration {
        get { fatalError() }
        set { aa_textField.font = newValue.setLanguageFont(aa_textField.font) }
    }
}

fileprivate extension UITextView {
    
    @objc var aalkChangeAllignment: AALK_Configuration {
        get { fatalError() }
        set { textAlignment.aalk_setAllignment() }
    }
    
    @objc var aalkChangeText: AALK_Configuration {
        get { fatalError() }
        set {
            guard let text = newValue.localizedString(text) else { return }
            self.text = text
        }
    }
    
    @objc var aalkChangeFont: AALK_Configuration {
        get { fatalError() }
        set { font = newValue.setLanguageFont(font) }
    }
}

fileprivate extension UIButton {
    
    @objc var aalkChangeAllignment: AALK_Configuration {
        get { fatalError() }
        set { titleLabel?.textAlignment.aalk_setAllignment() }
    }
    
    @objc var aalkChangeText: AALK_Configuration {
        get { fatalError() }
        set {
            if let text = newValue.localizedString(title(for: .normal)) { setTitle(text, for: .normal) }
            if let text = newValue.localizedString(title(for: .selected)) { setTitle(text, for: .selected) }
        }
    }
    
    @objc var aalkChangeFont: AALK_Configuration {
        get { fatalError() }
        set { titleLabel?.font = newValue.setLanguageFont(titleLabel?.font) }
    }
}

fileprivate extension UISegmentedControl {
    
    @objc var aalkChangeAllignment: AALK_Configuration {
        get { fatalError() }
        set { } // TODO
    }
    
    @objc var aalkChangeText: AALK_Configuration {
        get { fatalError() }
        set { } // TODO
    }
    
    @objc var aalkChangeFont: AALK_Configuration {
        get { fatalError() }
        set {
            let normalFont = titleTextAttributes(for: .normal)?[.font] as? UIFont
            let selectedFont = titleTextAttributes(for: .selected)?[.font] as? UIFont
            let _normalFont = newValue.setLanguageFont(normalFont ?? UIFont.systemFont(ofSize: newValue.sizeSegmentedControl))
            let _selectedFont = newValue.setLanguageFont(selectedFont ?? UIFont.systemFont(ofSize: newValue.sizeSegmentedControl))
            setTitleTextAttributes([NSAttributedString.Key.font: _normalFont as Any], for: .normal)
            setTitleTextAttributes([NSAttributedString.Key.font: _selectedFont as Any], for: .selected)
        }
    }
}
