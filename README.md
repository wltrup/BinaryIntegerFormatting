# BinaryIntegerFormatting
![](https://img.shields.io/badge/platforms-iOS%2010%20%7C%20tvOS%2010%20%7C%20watchOS%204%20%7C%20macOS%2010.14-red)
[![Xcode](https://img.shields.io/badge/Xcode-11-blueviolet.svg)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wltrup/BinaryIntegerFormatting)
![GitHub](https://img.shields.io/github/license/wltrup/BinaryIntegerFormatting)

## What

**BinaryIntegerFormatting** is a Swift Package Manager package for iOS/tvOS (10.0 and above), watchOS (4.0 and above), and macOS (10.14 and above), under Swift 5.0 and above, defining some useful functions for formatting integers.

Ordinarily, one should use `NumberFormatter` to format numbers but I've found use cases where this package has been more useful, especially when localisation isn't an issue.

```swift
public extension BinaryInteger {
    
    var digitCount: Int 
    
    func digits<Base: BinaryInteger>(base: Base) -> [Self] 
    
    var binaryDigits: [Self] 
    var decimalDigits: [Self] 
    
    func digitString<Base: BinaryInteger>(
        base: Base,
        separator c: Character,
        every n: Int
    ) -> String 
    
    func binaryString(
        separator c: Character = ".",
        every n: Int = 0,
        fullBithWidth: Bool = false
    ) -> String 
    
    func decimalString(
        separator c: Character = ",", 
        every n: Int = 3
    ) -> String 
    
    func formatted(
        width: Int,
        leftPadding: Character = " ",
        rightPadding: Character = " ",
        alignment: String.Alignment = .right
    ) -> String 
    
    var description: String {
        return decimalString()
    }
    
}
```

## Dependencies

**BinaryIntegerFormatting** depends on two other Swift packages of mine, [**StringFormatting**](https://github.com/wltrup/StringFormatting.git) and [**CollectionSplitting**](https://github.com/wltrup/CollectionSplitting.git).

## Installation

**BinaryIntegerFormatting** is provided only as a Swift Package Manager package, because I'm moving away from CocoaPods and Carthage, and can be easily installed directly from Xcode.

## Author

Wagner Truppel, trupwl@gmail.com

## License

**BinaryIntegerFormatting** is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
