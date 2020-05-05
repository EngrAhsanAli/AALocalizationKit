//
//  AALocalizationKit.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit

// MARK:- AALocalizationKit
public class AALocalizationKit {
    
    /// Singleton a.k.a AALK
    public static let shared: AALocalizationKit = AALocalizationKit()
    
    /// Callback for localized views when langauge changes
    public var localizedView: ((UIView) -> ())?
    
    /// AALK configurations
    public var configuration = AALK_Configuration()
    
    init() {
        let langCode = Locale.current.languageCode ?? "en"
        defaultLanguage = AALanguage(rawValue: langCode) ?? .en
    }
    
    /// Getter/Setter for current Language in the application, default is English language
    public var currentLanguage: AALanguage {
        get {
            guard let currentLang = DefaultKeys.selectedLanguageKey.get else {
                print("AALocalizationKit:- Setting English as current language")
                return .en
            }
            return AALanguage(rawValue: currentLang) ?? .en
        }
        set {
            DefaultKeys.selectedLanguageKey.set(value: newValue)
            
            UIView.appearance().semanticContentAttribute = newValue.isRightToLeft ? .forceRightToLeft : .forceLeftToRight

        }
    }
    
    /// Getter/Setter for default language in the application, default is English language
    public var defaultLanguage: AALanguage {
        get {
            guard let defaultLanguage = DefaultKeys.defaultLanguageKey.get else {
                print("AALocalizationKit:- Setting English as default language")
                return .en
            }
            return AALanguage(rawValue: defaultLanguage) ?? .en
        }
        set {
            
            if DefaultKeys.defaultLanguageKey.get == nil {
                
                DefaultKeys.defaultLanguageKey.set(value: newValue)
                DefaultKeys.selectedLanguageKey.set(value: newValue)
                
                currentLanguage = newValue
            }
            
            UIView.localize()
            Bundle.localize()
            
        }
    }
    
    /// Current language string
    var currentLanguageString: String {
        AALK.currentLanguage.rawValue
    }
    
    /// Getter for all fonts
    public var languageFonts: [AALanguage : [UIFont.Weight : String]] {
        AALK.configuration.languageFont
    }
    
    /// Getter for language semantic content attribute either right to left or not
    public var isRightToLeft: Bool {
        return currentLanguage.isRightToLeft
    }
    
    /// Get the current application Locale
    public var appLocale: Locale {
        return Locale(identifier: currentLanguage.rawValue)
    }
    
    /// Get all configured languages in the application's main bundle
    public var bundleLanguages: [String] {
        var languages = Bundle.main.localizations
        if let indexOfBase = languages.firstIndex(of: "Base") {
            languages.remove(at: indexOfBase)
        }
        return languages
    }
    
    /// Get all configured languages in the application's main bundle
    public var bundleLanguageNames: [String] {
        return bundleLanguages.compactMap {
            Locale.aalk_languageName(from: $0)
        }
    }
    
    
    /// Get all available languages in the main bundle of the application
    public var languages: [AALanguage] {
        return bundleLanguages.compactMap {
            AALanguage(rawValue: $0)
        }
    }
    
    /// Set New Language with animation
    /// - Parameters:
    ///   - language: language to set
    ///   - windows: window of the app
    ///   - viewControllerFactory: viewController factory
    ///   - animation: animation block
    public func setLanguage(language: AALanguage,
                            for windows: [(UIWindow?, String?)]? = nil,
                            viewControllerFactory: ((String?) -> UIViewController)? = nil,
                            animation: ((UIView) -> Void)? = nil) {
        
        AALK.currentLanguage = language
        guard let viewControllerFactory = viewControllerFactory else {
            return
        }

        var windowsToChange: [(UIWindow?, String?)]?
        if let windows = windows {
          windowsToChange = windows
        } else {
          if #available(iOS 13.0, *) {
            windowsToChange = UIApplication.shared.connectedScenes
              .compactMap({$0 as? UIWindowScene})
              .map({ ($0.windows.first, $0.title) })
          } else {
            windowsToChange = [(UIApplication.shared.keyWindow, nil)]
          }
        }
        
      
        windowsToChange?.forEach({ windowAndTitle in
    
            let (window, title) = windowAndTitle
            let rootViewController = viewControllerFactory(title)

            guard let snapshot = window?.snapshotView(afterScreenUpdates: true) else {
              return
            }
            rootViewController.view.addSubview(snapshot);

            window?.rootViewController = rootViewController

            UIView.animate(withDuration: 0.5, animations: {
              animation?(snapshot)
            }) { _ in
              snapshot.removeFromSuperview()
            }
        
      })

    }
}

