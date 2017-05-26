# SwiftyLogger
SwiftyLogger is simple swift logging library

### How to use

```swift
import SwiftyLogger

let log = SwiftyLogger.instance
```

you'd like to log something

```swift
log.verbose("This is Verbose Log")
log.debug("This is Debug Log")
log.info("This is Info Log")
log.warning("This is Warning Log")
log.error("This is Error Log")
```

your console output shown like below


## Optional

Change showing log settigs, default is all false

```swift
log.isDateHidden         = false
log.isFunctionNameHidden = false
log.isFileNameHidden     = false
```

You'd like to log something into file

```swift
log.isFileWrite = true
```

### Requirements
Swift3.0 or latter.

## Installation

SwiftyLogger is available through [Carthage](https://github.com/Carthage/Carthage) or
[Swift Package Manager](https://github.com/apple/swift-package-manager).

### Carthage

```
github "hlts2/SwiftyLogger"
```

for detail, please follow the [Carthage Instruction](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos)

### Swift Package Manager

```
dependencies: [
    .Package(url: "https://github.com/hlts2/SwiftyLogger.git", majorVersion: 1)
]
```

for detail, please follow the [Swift Package Manager Instruction](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md)
