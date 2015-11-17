# PySwiftyRegex
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PySwiftyRegex.svg)](https://cocoapods.org/pods/PySwiftyRegex)
[![License](https://img.shields.io/cocoapods/l/PySwiftyRegex.svg?style=flat&color=gray)](http://opensource.org/licenses/MIT)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/PySwiftyRegex.svg?style=flat)](http://cocoadocs.org/docsets/PySwiftyRegex)
[![Twitter](https://img.shields.io/badge/twitter-@AdamoCheng-blue.svg?style=flat)](http://twitter.com/AdamoCheng)

Swift에서 정규표현식을 Python처럼 쉽게 다뤄보세요.

[English](README.md)
[简体中文](https://github.com/cezheng/PySwiftyRegex/blob/master/README-zh.md)
[日本語](https://github.com/cezheng/PySwiftyRegex/blob/master/README-ja.md)

## 굉장히 쉽습니다

```swift
import PySwiftyRegex

if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
	m.group()  // "this is really easy"
	m.group(1) // "really "
}
```

아래에서 [더 많은 예제](#more_usage)를 볼 수 있습니다.

## 요구사항

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 7.0+

## 설치하기
> **임베드된 프레임워크를 사용하려면 iOS 8 또는 OS X Mavericks 이상을 지원해야 합니다.**
>
> `PySwiftyRegex`을 iOS 7 타겟 프로젝트에서 사용하려면 [CocoaSeeds](#cocoaseeds-for-ios7)를 사용하거나 혹은 [PySwiftyRegex.swift](https://github.com/cezheng/PySwiftyRegex/blob/master/PySwiftyRegex/PySwiftyRegex.swift) 파일을 다운받아 프로젝트에 직접 포함시켜야 합니다.

### CocoaPods (iOS 8+, OS X 10.9+)

[CocoaPods](http://cocoapods.org/)를 사용해서 `PySwiftyRegex`를 쉽게 설치할 수 있습니다. 다음과 같은 내용의 **Podfile**을 만들어주세요.

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'PySwiftyRegex', '~> 0.2.0'
end
```

그리고 쉘에서 아래 명령어를 실행하면 설치됩니다.

```bash
$ pod install
```

### Carthage (iOS 8+, OS X 10.9+)

**Cartfile** 또는 **Cartfile.private**에 아래 라인을 추가합니다.

```
github "cezheng/PySwiftyRegex" ~> 0.2.0
```

그리고 쉘에서 다음 명령어를 실행합니다.

```
$ carthage update
```

Carthage가 생성한 **PySwiftyRegex.framework**를 Xcode 프로젝트의 'General' 설정 아래의 'Embedded Binaries'에 추가합니다.

### CocoaSeeds (iOS 7+)

[CocoaSeeds](https://github.com/devxoul/CocoaSeeds)를 사용하면 Swift로 작성된 라이브러리를 iOS 7 프로젝트에서 사용할 수 있습니다.

먼저, **Seedfile**을 생성합니다.

```ruby
target :MyApp do
  github 'cezheng/PySwiftyRegex', '0.2.0', :files => 'PySwiftyRegex/PySwiftyRegex.swift'
end
```

그리고 다음과 같은 쉘 명령어를 실행합니다.

```console
$ seed install
```

PySwiftyRegex.swift 파일이 Xcode 프로젝트에 자동으로 포함된 것을 볼 수 있습니다. 즐코딩!

## 사용 가능한 re 모듈

Python의 [**re**](https://docs.python.org/2/library/re.html) 모듈에 익숙하다면 사용하는데 어려움이 없을 것입니다. 처음이거나 익숙하지 않은 경우, 아래 항목들을 보고 Python에서 정규표현식을 다루는 방식이 `NSRegularExpression`보다 어떻게 더 좋은지 확인해보세요.

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

## <a name="more_usage"></a>더 많은 예제
### 재사용을 위해 RegexObject 객체 컴파일하기
```swift
let regex = re.compile("this(.+)that")
```
### 문자열 첫 부분부터 패턴 매칭하기 
```swift
if let m = regex.match("this one is different from that") {
	m.group()  //"this one is different from that"
	m.group(1) //" one is different from "
}
```
### 패턴 검색하기 (가장 먼저 매칭되는 패턴)
```swift
if let m = regex.search("I want this one, not that one") {
	m.group()  //"this one, not that one"
	m.group(1) //" one, not "
}
```
### 매칭되는 모든 패턴 검색하기
```swift
regex.findall("this or that, this and that") // ["this or that", "this and that"]
```
### 모든 매칭 결과 가져오기
```swift
for m in regex.finditer("this or that, this and that") {
	m.group()  // 1st time: "this or that", 2nd time: "this and that"
	m.group(1) // 1st time: " or ", 2nd time: " and "
}
```
### 정규식으로 문자열 자르기
```swift
let regex = re.compile("[\\+\\-\\*/]")

// By default, will split at all occurrences of the pattern
regex.split("1+2-3*4/5")    // ["1", "2", "3", "4", "5"]

// Setting a maxsplit = 2
regex.split("1+2-3*4/5", 2) // ["1", "2", "3*4/5"]
```
### 패턴 치환하기
```swift
let regex = re.compile("[Yy]ou")

// Replacing all occurrences (2 times in this example)
regex.sub("u", "You guys go grap your food")     // "u guys go grap ur food"
regex.subn("u", "You guys go grap your food")    // ("u guys go grap ur food", 2)

// Setting maximum replace count = 1 (1 times in this example)
regex.sub("u", "You guys go grap your food", 1)  // "u guys go grap your food"
regex.subn("u", "You guys go grap your food", 1) // ("u guys go grap your food", 1)
```

## 라이센스

`PySwiftyRegex`는 MIT 라이센스 하에 배포됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.
