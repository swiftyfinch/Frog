Frog
====

[![Swift Version](https://img.shields.io/badge/Swift-3.1-orange.svg)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://www.apple.com/ru/ios)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg)](https://github.com/artFintch/Frog/blob/master/LICENSE)

Tiny utility for read and write file line by line in Swift. I wrote this for easier work with files in some algorithms implementations. In some cases read and write line by line in Swift take a lot of part of an implementation 😟.
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

## License
Released under the MIT license. See [LICENSE](https://github.com/artFintch/TableMVC/blob/master/LICENSE) for details.
