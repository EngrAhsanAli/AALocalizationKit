//
//  AALK+NSTextAlignment.swift
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

// MARK: - NSTextAlignment extension for AALK
extension NSTextAlignment {
    
    /// Set character direction for languages supporting left and right directions
    mutating func setAllignment() {
        guard self != .natural else { return }
        self = AALK.isRightToLeft ? .right : .left
    }
    
    /// Set character direction for languages supporting left and right directions
    public mutating func aalk_setAllignment() {
        self = AALK.isRightToLeft ? .right : .left
    }
    
    /// Set character direction for languages supporting left and right directions
    public mutating func aalk_setInverseAllignment() {
        self = !AALK.isRightToLeft ? .right : .left
    }
}
