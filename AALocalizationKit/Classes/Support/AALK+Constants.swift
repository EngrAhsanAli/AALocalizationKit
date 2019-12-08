//
//  AALocalizationKit+Constants.swift
//  AALocalizationKit
//
//  Created by M. Ahsan Ali on 22/10/2019.
//

import Foundation

public let AALK = AALocalizationKit.shared

// MARK: - DefaultKeys

enum DefaultKeys: String {
    case selectedLanguageKey = "AALocalizationKitSelectedLanguage"
    case defaultLanguageKey = "AALocalizationKitDefaultLanguage"
    case unlocalizedKey = "<unlocalized>"

}

// MARK: - AALanguage


public enum AALanguage: String {
    case enGB = "en-GB"
    case enAU = "en-AU"
    case enCA = "en-CA"
    case enIN = "en-IN"
    case frCA = "fr-CA"
    case esMX = "es-MX"
    case ptBR = "pt-BR"
    case zhHans = "zh-Hans"
    case zhHant = "zh-Hant"
    case zhHK = "zh-HK"
    case es419 = "es-419"
    case ptPT = "pt-PT"
    case deviceLanguage
    case ar,en,nl,ja,ko,vi,ru,sv,fr,es,pt,it,de,da,fi,nb,tr,el,id,
           ms,th,hi,hu,pl,cs,sk,uk,hr,ca,ro,he,ur,fa,ku,arc,sl,ml
}
