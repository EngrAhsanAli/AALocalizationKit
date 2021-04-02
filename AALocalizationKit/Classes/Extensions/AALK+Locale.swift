//
//  AALK+Locale.swift
//  AALocalizationKit
//
//  Created by Engr. Ahsan Ali on 22/10/2019.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
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

// MARK:- Locale for App
public extension Locale {
    
    /// Returns the language display name
    /// - Parameter identifier: language identifier
    static func aalk_languageName(from identifier: String) -> String {
        NSLocale(localeIdentifier: identifier).displayName(forKey: .identifier , value: identifier) ?? identifier
    }
    
    func aalk_setCurrentLanguage() {
        guard let lang = AALanguage(rawValue: identifier) else { return }
        AALK.currentLanguage = lang
    }
    
    static var aalk_isRightToLeft: Bool { AALK.isRightToLeft }
    
    static var aalk_language: String { AALK.currentLanguage.rawValue }

}
