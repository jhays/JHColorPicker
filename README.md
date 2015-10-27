# JHColorPicker

[![CI Status](http://img.shields.io/travis/JHays/JHColorPicker.svg?style=flat)](https://travis-ci.org/JHays/JHColorPicker)
[![Version](https://img.shields.io/cocoapods/v/JHColorPicker.svg?style=flat)](http://cocoapods.org/pods/JHColorPicker)
[![License](https://img.shields.io/cocoapods/l/JHColorPicker.svg?style=flat)](http://cocoapods.org/pods/JHColorPicker)
[![Platform](https://img.shields.io/cocoapods/p/JHColorPicker.svg?style=flat)](http://cocoapods.org/pods/JHColorPicker)

JHColorPicker is a color picker that includes swatches from Crayola, Pantone, and ChameleonFramework flat colors, as well as a custom color picker

![Screenshot](https://raw.githubusercontent.com/jhays/JHColorPicker/master/JHColorPicker-Demo.gif)

This color picker is a combination of the following pods:

InfinitApps/InfColorPicker 
https://github.com/InfinitApps/InfColorPicker

ViccAlexander/Chameleon
https://github.com/ViccAlexander/Chameleon

mihaelamj/uicolor-crayola
https://github.com/mihaelamj/uicolor-crayola

mihaelamj/uicolor-pantone
https://github.com/mihaelamj/uicolor-pantone

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
  let colorPickerController = JHColorPickerController()
  colorPickerController.delegate = self
  colorPickerController.previousColor = self.view.backgroundColor
  colorPickerController.completion = { selectedColor in
    self.view.backgroundColor = selectedColor
  }
  self.presentViewController(UINavigationController(rootViewController: colorPickerController), animated: true, completion: nil)
```
## Requirements
iOS 8+, XCode 7+

(Included via pod dependency):
* ChameleonFramework
* ColorUtils
* UIColor-Crayola 
* UIColor-Pantone

## Installation

JHColorPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JHColorPicker"
```

## Author

JHays, orbosphere@gmail.com

## License

JHColorPicker is available under the MIT license. See the LICENSE file for more info.
