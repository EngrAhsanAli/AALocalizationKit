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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AALocalizationKit.shared.customFonts = [.ar: "DubaiW23", .en: "MavenPro"]
        AALocalizationKit.shared.setSystemDefault("MavenPro-Regular")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAppearance() {
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "nav_bar"), for: .default)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        UINavigationBar.appearance().frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80)

        UIToolbar.appearance().barTintColor = UIColor.black
        UIToolbar.appearance().tintColor = .white
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor:UIColor.black as Any
            ], for: .selected)
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black as Any
            ], for: .normal)
        
        
        let font = AALocalizationKit.shared.getFont(type: .medium, size: 16)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        if #available(iOS 11.0, *) {
            UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).setTitleTextAttributes([
                .foregroundColor : UIColor.black as Any
                ], for: .normal)
        }
    }

    func checkLanguageAvailable() {
        let localeArray = "ASD".components(separatedBy: ",")
        let isAvailable = localeArray.contains(AALocalizationKit.shared.currentLanguage.rawValue)
        guard !isAvailable else { return }
        AALocalizationKit.shared.currentLanguage = Languages(rawValue: localeArray.first!)!
    }
    
}

