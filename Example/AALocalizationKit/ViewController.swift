//
//  ViewController.swift
//  AALocalizationKit
//
//  Created by EngrAhsanAli on 06/19/2019.
//  Copyright (c) 2019 EngrAhsanAli. All rights reserved.
//

import UIKit
import AALocalizationKit

class ViewController: UIViewController {

    @IBOutlet weak var langPicker: PickerView!
    @IBOutlet weak var locallizedLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLanguagePicker()
        localizedViewCallback()
                
    }
    
    /// Set the language picker
    func setLanguagePicker() {
        langPicker.setIcon()
        langPicker.valueDidSelected = { self.updateAppLanguage($0 as! Int) }

        let languageNames = AALK.bundleLanguageNames

        if languageNames.count > 1 {
            langPicker.pickerType = .string(data: languageNames)
            langPicker.pickerRow.font = UIFont(name: AALK.configuration.defaultFont, size: 15)
            langPicker.text = Locale.aalk_languageName(from: AALK.currentLanguage.rawValue)
        }
        
    }
    
    /// set localizedViewCallback
    func localizedViewCallback() {
        AALK.localizedView = {
            
            if let v = ($0 as? UIButton), let font = v.titleLabel?.font {
                print("Applied Font (UIButton): ", font)
            }
            
            if let v = ($0 as? UILabel), let font =  v.font {
                print("Applied Font (UILabel): ", font)
            }
            
            if let v = ($0 as? UITextField), let font =  v.font {
                print("Applied Font (UITextField): ", font)
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /// Update the language of the application
    /// - Parameter index: lang index
    func updateAppLanguage(_ index: Int) {
                
        let lang = AALK.languages[index]
        guard AALK.currentLanguage != lang else { return }
        AALK.currentLanguage = lang
        print("New Language: ", AALK.appLocale)
        
        // Reload this view
        reloadViewFromNib()
        
    }
    
}







