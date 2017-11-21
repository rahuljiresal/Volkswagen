# Volkswagen

[![Version](https://img.shields.io/cocoapods/v/Volkswagen.svg?style=flat)](http://cocoapods.org/pods/Volkswagen)
[![License](https://img.shields.io/cocoapods/l/Volkswagen.svg?style=flat)](http://cocoapods.org/pods/Volkswagen)
[![Platform](https://img.shields.io/cocoapods/p/Volkswagen.svg?style=flat)](http://cocoapods.org/pods/Volkswagen)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

Import Volkswagen by using `import Volkswagen`.

To do a fresh check to see if your app is in review, do `Volkswagen.defaultInstance.check()`.

You can also use the callback,
```swift
Volkswagen.defaultInstance.check { (isAppInReview) in
    // do something here
}```

Check is only needed to be performed once. After that, you can just check the Boolean value of `Volkswagen.defaultInstance.isAppInReview`.

For example,

```swift
if (Volkswagen.defaultInstance.isAppInReview) {
	// do something here
}```

*Note: If you get the value of `Volkswagen.defaultInstance.isAppInReview` before calling `Volkswagen.defaultInstance.check()`, it will always return `true`.*

## Installation

Volkswagen is available as a [CocoaPod](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Volkswagen', :git => 'https://github.com/rahuljiresa/Volkswagen.git'
```

## Author

@rahuljiresal, rahul.jiresal@gmail.com, rahul@redbooth.com

## License

Volkswagen is available under the MIT license. See the LICENSE file for more info.
