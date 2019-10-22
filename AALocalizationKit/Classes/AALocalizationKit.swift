//
//  AALocalizationKit.swift
//  AALocalizationKit
//
//  Created by Ahsan Ali on 11/06/2019.
//  Copyright © 2019 AA Creations. All rights reserved.
//

import UIKit

public class AALocalizationKit {
    
    public static let shared: AALocalizationKit = AALocalizationKit()
    
    public var deafultFontName = "GillSans"
    
    public var customFonts: [Languages: String]?
    
    public var currentLanguage: Languages {
        get {
            guard let currentLang = UserDefaults.standard.string(forKey: Constant.selectedLanguageKey.rawValue) else {
                fatalError("AALocalizationKit:- Did you set the default language for the app ?")
            }
            return Languages(rawValue: currentLang)!
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Constant.selectedLanguageKey.rawValue)
        }
    }
    
    public var defaultLanguage: Languages {
        get {
            
            guard let defaultLanguage = UserDefaults.standard.string(forKey: Constant.defaultLanguageKey.rawValue) else {
                fatalError("Did you set the default language for the app ?")
            }
            return Languages(rawValue: defaultLanguage)!
        }
        set {
            
            UIView.localize()
            Bundle.localize()
            
            let defaultLanguage = UserDefaults.standard.string(forKey: Constant.defaultLanguageKey.rawValue)
            guard defaultLanguage == nil else {
                setLanguage(language: currentLanguage)
                return
            }
            
            UserDefaults.standard.set(newValue.rawValue, forKey: Constant.defaultLanguageKey.rawValue)
            UserDefaults.standard.set(newValue.rawValue, forKey: Constant.selectedLanguageKey.rawValue)
            setLanguage(language: newValue)
        }
    }
    
    public var isRightToLeft: Bool {
        get {
            return isLanguageRightToLeft(language: currentLanguage)
        }
    }
    
    public var appLocale: Locale {
        get {
            return Locale(identifier: currentLanguage.rawValue)
        }
    }
    
    public func setLanguage(language: Languages, rootViewController: UIViewController? = nil, animation: ((UIView) -> Void)? = nil) {
        
        let semanticContentAttribute: UISemanticContentAttribute = isLanguageRightToLeft(language: language) ? .forceRightToLeft : .forceLeftToRight
        UIView.appearance().semanticContentAttribute = semanticContentAttribute
        
        currentLanguage = language
        
        guard let rootViewController = rootViewController else {
            return
        }
        
        let snapshot = (UIApplication.shared.keyWindow?.snapshotView(afterScreenUpdates: true))!
        rootViewController.view.addSubview(snapshot)
        
        UIApplication.shared.delegate?.window??.rootViewController = rootViewController
        
        UIView.animate(withDuration: 0.5, animations: {
            animation?(snapshot)
        }) { _ in
            snapshot.removeFromSuperview()
        }
        
    }
    
    private func isLanguageRightToLeft(language: Languages) -> Bool {
        return Locale.characterDirection(forLanguage: language.rawValue) == .rightToLeft
    }
    
    public func setSystemDefault(_ fontName: String?) {
        let langCode = Locale.current.languageCode ?? "en"
        defaultLanguage = Languages(rawValue: langCode) ?? .en
        if let name = fontName {
            deafultFontName = name
        }
    }
    
    public func getFont(type: FontTypes = .regular, size: CGFloat = 16) -> UIFont {
        let deafultName = deafultFontName
        let name = deafultName.fontFamily ?? deafultName
        let fontName =  "\(name)-\(type.rawValue)"
        var defaultFont =  UIFont(name: fontName, size: size)!
        if let font = defaultFont.languageFont {
            defaultFont = font
        }
        return defaultFont
    }
    
    open class func availableLanguages(_ excludeBase: Bool = false) -> [String] {
        var availableLanguages = Bundle.main.localizations
        if let indexOfBase = availableLanguages.firstIndex(of: "Base") , excludeBase == true {
            availableLanguages.remove(at: indexOfBase)
        }
        return availableLanguages
    }
}







