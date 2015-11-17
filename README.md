# PySwiftyRegex
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PySwiftyRegex.svg)](https://cocoapods.org/pods/PySwiftyRegex)
[![License](https://img.shields.io/cocoapods/l/PySwiftyRegex.svg?style=flat&color=gray)](http://opensource.org/licenses/MIT)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/PySwiftyRegex.svg?style=flat)](http://cocoadocs.org/docsets/PySwiftyRegex)
[![Twitter](https://img.shields.io/badge/twitter-@AdamoCheng-blue.svg?style=flat)](http://twitter.com/AdamoCheng)

Easily deal with Regex in Swift in a Pythonic way.

[简体中文](https://github.com/cezheng/PySwiftyRegex/blob/master/README-zh.md)
[日本語](https://github.com/cezheng/PySwiftyRegex/blob/master/README-ja.md)
## This is Easy

```swift
import PySwiftyRegex

if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
	m.group()  // "this is really easy"
	m.group(1) // "really "
}
```
See [More examples](#more_usage).

## Requirements

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 7.0+


## Installation
> **Embedded frameworks require a minimum deployment target of iOS 8 or OS X Mavericks.**
>
> To use `PySwiftyRegex` with a project targeting iOS 7, consider using [CocoaSeeds](#cocoaseeds-for-ios7) or copy the [PySwiftyRegex.swift](https://github.com/cezheng/PySwiftyRegex/blob/master/PySwiftyRegex/PySwiftyRegex.swift) file into your project.

### CocoaPods(iOS 8+, OS X 10.9+)
You can use [Cocoapods](http://cocoapods.org/) to install `PySwiftyRegex` by adding it to your to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'PySwiftyRegex', '~> 0.2.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage(iOS 8+, OS X 10.9+)
Adding the following line to your `Cartfile` or `Cartfile.private`:

```
github "cezheng/PySwiftyRegex" ~> 0.2.0
```
Run the following command:

```
$ carthage update
```
Then drag the `PySwiftyRegex.framework` built by Carthage into your target's `General` -> `Embedded Binaries`.

### CocoaSeeds (for iOS 7)

[CocoaSeeds](https://github.com/devxoul/CocoaSeeds) allows you to use Swift libraries in iOS 7 projects.

Create **Seedfile**:

```ruby
target :MyApp do
  github 'cezheng/PySwiftyRegex', '0.2.0', :files => 'PySwiftyRegex/PySwiftyRegex.swift'
end
```

Then run the following command:

```console
$ seed install
```

Now you can see the PySwiftyRegex.swift file in your Xcode project. Build and enjoy!

## Supported re methods
If you are familiar with Python's [**re**](https://docs.python.org/2/library/re.html) module, you are ready to go. If not, you may like to check how Python's re is better than the cumbersome NSRegularExpression's APIs, by clicking at the items below.
### [re](https://docs.python.org/2/library/re.html#module-contents)
* [re.compile](https://docs.python.org/2/library/re.html#re.compile)
* [re.search](https://docs.python.org/2/library/re.html#re.search)
* [re.match](https://docs.python.org/2/library/re.html#re.match)
* [re.split](https://docs.python.org/2/library/re.html#re.split)
* [re.findall](https://docs.python.org/2/library/re.html#re.findall)
* [re.finditer](https://docs.python.org/2/library/re.html#re.finditer)
* [re.sub](https://docs.python.org/2/library/re.html#re.sub)
* [re.subn](https://docs.python.org/2/library/re.html#re.subn)

### [re.RegexObject](https://docs.python.org/2/library/re.html#regular-expression-objects)
* [search](https://docs.python.org/2/library/re.html#re.RegexObject.search)
* [match](https://docs.python.org/2/library/re.html#re.RegexObject.match)
* [split](https://docs.python.org/2/library/re.html#re.RegexObject.split)
* [findall](https://docs.python.org/2/library/re.html#re.RegexObject.findall)
* [finditer](https://docs.python.org/2/library/re.html#re.RegexObject.finditer)
* [sub](https://docs.python.org/2/library/re.html#re.RegexObject.sub)
* [subn](https://docs.python.org/2/library/re.html#re.RegexObject.subn)

### [re.MatchObject](https://docs.python.org/2/library/re.html#match-objects)
* [expand](https://docs.python.org/2/library/re.html#re.MatchObject.expand)
* [group](https://docs.python.org/2/library/re.html#re.MatchObject.group)
* [groups](https://docs.python.org/2/library/re.html#re.MatchObject.groups)
* [span](https://docs.python.org/2/library/re.html#re.MatchObject.span)

## <a name="more_usage"></a>More Usage Examples
### Compile a RegexObject for future reuse
```swift
let regex = re.compile("this(.+)that")
```
### Matching a pattern from beginning
```swift
if let m = regex.match("this one is different from that") {
	m.group()  //"this one is different from that"
	m.group(1) //" one is different from "
}
```
### Searching a pattern (first match)
```swift
if let m = regex.search("I want this one, not that one") {
	m.group()  //"this one, not that one"
	m.group(1) //" one, not "
}
```
### Find all occurrences of a pattern
```swift
regex.findall("this or that, this and that") // ["this or that", "this and that"]
```
### Get match results for all occurrences of a pattern
```swift
for m in regex.finditer("this or that, this and that") {
	m.group()  // 1st time: "this or that", 2nd time: "this and that"
	m.group(1) // 1st time: " or ", 2nd time: " and "
}
```
### Splitting a string with pattern
```swift
let regex = re.compile("[\\+\\-\\*/]")

// By default, will split at all occurrences of the pattern
regex.split("1+2-3*4/5")    // ["1", "2", "3", "4", "5"]

// Setting a maxsplit = 2
regex.split("1+2-3*4/5", 2) // ["1", "2", "3*4/5"]
```
### Replacing a pattern
```swift
let regex = re.compile("[Yy]ou")

// Replacing all occurrences (2 times in this example)
regex.sub("u", "You guys go grap your food")     // "u guys go grap ur food"
regex.subn("u", "You guys go grap your food")    // ("u guys go grap ur food", 2)

// Setting maximum replace count = 1 (1 times in this example)
regex.sub("u", "You guys go grap your food", 1)  // "u guys go grap your food"
regex.subn("u", "You guys go grap your food", 1) // ("u guys go grap your food", 1)
```

## License

`PySwiftyRegex` is released under the MIT license. See [LICENSE](https://github.com/cezheng/PySwiftyRegex/blob/master/LICENSE) for details.
