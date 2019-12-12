

# Table of Contents

- [AALocalizationKit](#section-id-4)
  - [Description](#section-id-10)
  - [Demonstration](#section-id-16)
  - [Requirements](#section-id-26)
- [Installation](#section-id-32)
  - [CocoaPods](#section-id-37)
  - [Carthage](#section-id-63)
  - [Manual Installation](#section-id-82)
- [Getting Started](#section-id-87)
- [Contributions & License](#section-id-156)


<div id='section-id-4'/>

#AALocalizationKit

[![Swift 3.0](https://img.shields.io/badge/Swift-5.1-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AALocalizationKit.svg)](http://cocoadocs.org/docsets/AALocalizationKit) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AALocalizationKit.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AALocalizationKit) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AALocalizationKit.svg)]()


<div id='section-id-10'/>

##Description

AALocalizationKit is really helpful to maintain multiple languages in the application with their custom language fonts and an ability to change the language within your application!

![](https://github.com/EngrAhsanAli/AALocalizationKit/blob/master/Screenshots/Demo.png)

<div id='section-id-16'/>

##Demonstration

`AALocalizationKit` is easily configured framework to configure multiple languages in the iOS application.

![](https://github.com/EngrAhsanAli/AALocalizationKit/blob/master/Screenshots/Demo.gif)





To run the example project, clone the repo, and run `pod install` from the Example directory first.


<div id='section-id-26'/>

##Requirements

- iOS 10.0+
- Xcode 11.0+
- Swift 5+

<div id='section-id-32'/>

# Installation

`AALocalizationKit` can be installed using CocoaPods, Carthage, or manually.


<div id='section-id-37'/>

##CocoaPods

`AALocalizationKit` is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

`$ gem install cocoapods`

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AALocalizationKit'
end

```

Finally, run the following command to install it:
```
$ pod install
```



<div id='section-id-63'/>

##Carthage

To install Carthage, run (using Homebrew):
```
$ brew update
$ brew install carthage
```
Then add the following line to your Cartfile:

```
github "EngrAhsanAli/AALocalizationKit" "master"
```

Then import the library in all files where you use it:
```swift
import AALocalizationKit
```


<div id='section-id-82'/>

##Manual Installation

If you prefer not to use either of the above mentioned dependency managers, you can integrate `AALocalizationKit` into your project manually by adding the files contained in the Classes folder to your project.


<div id='section-id-87'/>

#Getting Started
----------

Just need to configure the supporting languages for *Localization* within your the iOS application in you **AppDelegate** `didFinishLaunchingWithOptions` method.

Following is the example to configure this with following languages support.

<div id='section-id-90'/>



**Usage**:
```swift

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
```

Now just update the language in your view controller
```swift
let languageNames = AALK.bundleLanguageNames // get all bundle languages
let lang = AALK.languages[index] // where index is the language index for specific langauge
AALK.currentLanguage = lang // Set the language within your application

/// NOW YOU JUST NEED TO RECALL YOUR VIEW OR VIEW CONTROLLER TO SEE THE CHANGES
```



<div id='section-id-156'/>

#Contributions & License

`AALocalizationKit` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AALocalizationKit` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)
