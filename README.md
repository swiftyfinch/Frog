# Frog

[![Version](https://img.shields.io/cocoapods/v/Frog.svg?style=flat)](https://cocoapods.org/pods/Frog)
[![CI Status](https://img.shields.io/travis/artFintch/Frog.svg?style=flat)](https://travis-ci.org/artFintch/Frog)<br>
[![Swift Version](https://img.shields.io/badge/Swift-4.2-orange.svg)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/cocoapods/p/Frog.svg?style=flat)](https://cocoapods.org/pods/Frog)
[![License](https://img.shields.io/cocoapods/l/Frog.svg?style=flat)](https://cocoapods.org/pods/Frog)<br>
[![Twitter](https://img.shields.io/badge/twitter-@artFintch-blue.svg?style=flat)](https://twitter.com/artFintch)

Tiny utility for read and write file line by line in Swift. I wrote this for easier work with files in some algorithms implementations. In some cases read and write line by line in Swift take a lot of part of an implementation.
- Automatically closing a file after `deinit` a frog;
- You don't need to work with pointers explicitly;
- Read and write line by line in one line.

###### Read:
```swift
let path = "path/to/your/file"
let input = Frog(path)

if let newLine = input.readLine() {
  print(newLine)
}
```
###### Write:
```swift
let path = "path/to/your/file"
let output = Frog(path, mode: .w)
output.write(line: "Croak-croak")
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

###### Installation

Frog is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Frog'
```

## Author

Vyacheslav Khorkov, artfintch@ya.ru

## License

Frog is available under the MIT license. See the LICENSE file for more info.
