//
//  Extensions.swift
//  AALocalizationKit_Example
//
//  Created by M. Ahsan Ali on 16/11/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import AAPickerView
import AALocalizationKit

// MARK: - Global
let appDelegate = UIApplication.shared.delegate as! AppDelegate


// MARK: - UITextField
extension UITextField {
    
    func setIcon() {
        
        let padding = 8
        let size = 18
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = #imageLiteral(resourceName: "down_arrow")
        outerView.addSubview(iconView)
        
        rightView = outerView
        rightViewMode = .always
    }
    
}

// MARK: - AAPickerView
class PickerView: AAPickerView {
    
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    override func selectionRects(for range: UITextRange) -> [Any] {
        return []
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
}

// MARK: - UIViewController

extension UIViewController {
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view)

    }
}


// MARK: - AALocalizationKit

func configureAALK() {
    let languageFont: [AALanguage : [UIFont.Weight : String]] = [
        .ar : [.regular: "Jomhuria"],
        
        .zhHans : [.regular: "Chibrush"],
        
        .fr : [.regular: "MuchaFrenchCapitals"],
        
        .de : [.regular: "LemonadeStand"],
        
        .en : [.regular: "Roboto-Regular",
               .medium: "Roboto-Medium",
               .bold: "Roboto-Bold"],
        
        .ja : [.regular: "NotoSerifJP-Regular",
               .medium: "NotoSerifJP-Medium",
               .bold: "NotoSerifJP-Bold"]
    ]
            
    AALK.configuration.languageFont = languageFont
    AALK.configuration.defaultFont = "Roboto"
}
