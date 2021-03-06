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
        
        let dynamicLabel = UILabel(frame: CGRect.init(x: 0,
                                                      y: UIScreen.main.bounds.size.height - 200,
                                                      width:  UIScreen.main.bounds.size.width,
                                                      height: 100))
        dynamicLabel.text = "A dynamic label added programatically"
        dynamicLabel.numberOfLines = 0
        dynamicLabel.textAlignment = .center
        dynamicLabel.textColor = .blue
        self.view.addSubview(dynamicLabel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /// Update the language of the application
    /// - Parameter index: lang index
    func updateAppLanguage(_ index: Int) {
                
        let lang = AALK.languages[index]
        guard AALK.currentLanguage != lang else { return }

        // Reload this view
        reloadViewFromNib()
        
        AALK.setLanguage(language: lang, viewController: { _ in 
            self.storyboard!.instantiateInitialViewController()!
        }) { view in
          view.transform = CGAffineTransform(scaleX: 2, y: 2)
          view.alpha = 0
        }
        
        print("New Language: ", AALK.appLocale)
        
    }
    
}







