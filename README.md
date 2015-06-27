# PySwiftyRegex
Easily deal with Regex in Swift in a Pythonic way.

## This is Easy

```swift
import PySwiftyRegex

if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
	m.group()  // "this is really easy"
	m.group(1) // "really "
}
```

## Requirements

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 7.0

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

## Installation
> **Embedded frameworks require a minimum deployment target of iOS 8 or OS X Mavericks.**
>
> To use `PySwiftyRegex` with a project targeting iOS 7, copy the [PySwiftyRegex.swift](https://github.com/cezheng/PySwiftyRegex/blob/master/PySwiftyRegex/PySwiftyRegex.swift) file into your project.

### CocoaPods(iOS 8+, OS X 10.9+)
You can use [Cocoapods](http://cocoapods.org/) to install `PySwiftyRegex` by adding it to your to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'PySwiftyRegex', '~> 0.1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## License

`PySwiftyRegex` is released under the MIT license. See [LICENSE](https://github.com/cezheng/PySwiftyRegex/blob/master/LICENSE) for details.