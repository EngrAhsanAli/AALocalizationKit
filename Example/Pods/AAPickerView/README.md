# Table of Contents

- [AAPickerView](#section-id-4)
  - [Description](#section-id-10)
  - [Demonstration](#section-id-16)
  - [Requirements](#section-id-26)
- [Installation](#section-id-32)
  - [CocoaPods](#section-id-37)
  - [Carthage](#section-id-63)
  - [Manual Installation](#section-id-82)
- [Getting Started](#section-id-87)
  - [Create instance of AAPickerView](#section-id-90)
  - [Define picker type](#section-id-104)
  - [Customise the toolbar](#section-id-112)
  - [Customise StringPicker Label](#section-id-132)
  - [Customise UIDatePicker & DateFormatter](#section-id-150)
  - [Listen changes thorough callbacks](#section-id-151)
- [Contributions & License](#section-id-156)


<div id='section-id-4'/>

#AAPickerView

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AAPickerView.svg)](http://cocoadocs.org/docsets/AAPickerView) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AAPickerView.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AAPickerView) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AAPickerView.svg)]()


<div id='section-id-10'/>

##Description


AAPickerView is simple and easy-to-use implementation for `UITextField` to use as `UIPickerView` and `UIDatePicker` written in swift. It allows to transform `UITextField` as `UIPickerView` and `UIDatePicker` to pick data easily. It is designed to present a picker view to select data in `UITextField`.


<div id='section-id-16'/>

##Demonstration



![](https://github.com/EngrAhsanAli/AAPickerView/blob/master/Screenshots/demo.gif)


To run the example project, clone the repo, and run `pod install` from the Example directory first.


<div id='section-id-26'/>

##Requirements

- iOS 8.0+
- Xcode 8.0+


<div id='section-id-32'/>

# Installation

`AAPickerView` can be installed using CocoaPods, Carthage, or manually.


<div id='section-id-37'/>

##CocoaPods

`AAPickerView` is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

`$ gem install cocoapods`

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
// Swift 3.2+ Compatibility
pod 'AAPickerView'
// Swift 4 Compatibility
pod 'AAPickerView', '~> 0.1.2'
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
github "EngrAhsanAli/AAPickerView" "master"
```

Then import the library in all files where you use it:
```swift
import AAPickerView
```


<div id='section-id-82'/>

##Manual Installation

If you prefer not to use either of the above mentioned dependency managers, you can integrate `AAPickerView` into your project manually by adding the files contained in the Classes folder to your project.


<div id='section-id-87'/>

#Getting Started
----------

<div id='section-id-90'/>

##Create instance of AAPickerView

You just need to assign `AAPickerView` class to your `UITextField` and make the outlet:
```swift
@IBOutlet weak var picker: AAPickerView!
```

Now your `UITextField` is transformed as a picker view as `AAPickerView`.


<div id='section-id-104'/>

##Define picker type

Define type of picker you want to use in your text field. There are two types of pickers available in `AAPickerView` that are:

- `StringPicker` for `UIPickerView`
- `DatePicker` for `UIDatePicker`

Assign one of them as follow:

```swift
picker1.pickerType = .StringPicker
picker2.pickerType = .DatePicker
```

<div id='section-id-112'/>

##Customise the toolbar

You can change `UIToolbar` colours like:
```swift
picker.toolbar.barTintColor = .darkGray
picker.toolbar.tintColor = .black
```

<div id='section-id-132'/>

##Customise StringPicker Label

You can get and customise the `StringPicker` label as `UILabel`:
```swift
let label = picker.pickerRow
label.font = UIFont(name: "American Typewriter", size: 30)
```

<div id='section-id-150'/>

##Customise UIDatePicker & DateFormatter

You can get your `UIDatePicker` and `DateFormatter` which is using behind your `UITextField` as:
```swift
let datePicker = picker.datePicker
datePicker?.datePickerMode = .date

let dateFormatter = picker.dateFormatter
dateFormatter.dateFormat = "dd/MM/YYYY" 
```


<div id='section-id-151'/>

##Listen changes thorough callbacks

You can listen the changes of data simply by using the following callback methods:

- StringPicker:
```swift
picker.stringDidChange = { index in
print("selectedString ", self.stringData[index])
}
```

- DatePicker
```swift
picker.dateDidChange = { date in
print("selectedDate ", date )
}
```


<div id='section-id-156'/>

#Contributions & License

`AAPickerView` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AAPickerView` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)

