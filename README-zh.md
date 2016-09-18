# PySwiftyRegex
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PySwiftyRegex.svg)](https://cocoapods.org/pods/PySwiftyRegex)
[![License](https://img.shields.io/cocoapods/l/PySwiftyRegex.svg?style=flat&color=gray)](http://opensource.org/licenses/MIT)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/PySwiftyRegex.svg?style=flat)](http://cocoadocs.org/docsets/PySwiftyRegex)
[![Twitter](https://img.shields.io/badge/twitter-@AdamoCheng-blue.svg?style=flat)](http://twitter.com/AdamoCheng)

像Python一样简洁高效地作正则处理。

[English](README.md)
[日本語](README-ja.md)
[한국어](README-ko.md)

## 先上代码

```swift
import PySwiftyRegex

if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
	m.group()  // "this is really easy"
	m.group(1) // "really "
}
```
查看 [常见用例](#more_usage).

## 环境

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 8.0+

> Swift 2.3请使用[0.3.0](../../releases/tag/0.3.0)版。

## 导入
> **使用 Embedded frameworks 至少需要 iOS 8 或 OS X Mavericks.**
>
> 如果您的项目需要支持iOS 7但仍想使用 `PySwiftyRegex`, 您需要将源代码文件 [PySwiftyRegex.swift](https://github.com/cezheng/PySwiftyRegex/blob/master/PySwiftyRegex/PySwiftyRegex.swift) 下载并添加到您的Xcode项目中。

### CocoaPods(iOS 8+, OS X 10.9+)
您可以通过 [Cocoapods](http://cocoapods.org/) 来将 `PySwiftyRegex` 添加到您的项目中。 下面是一个示例的`Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'PySwiftyRegex', '~> 0.2.0'
end
```

配置好Podfile后执行如下命令:

```bash
$ pod install
```

### Carthage(iOS 8+, OS X 10.9+)
往 `Cartfile` 或 `Cartfile.private` 中加入如下一行:

```
github "cezheng/PySwiftyRegex" ~> 0.2.0
```
然后执行如下命令:

```
$ carthage update
```
最后将Carthage编译出来的`PySwiftyRegex.framework`拖拽入目标的`General` -> `Embedded Binaries`。

## 已实现的re模块方法
如果您已有 [**re**](https://docs.python.org/2/library/re.html) 模块的使用经验, 那么基本上将这个库导入到项目中就可以直接开始用了。 如果没有，或许可以点击下方的链接传送到Python的文档页面大致了解一下为何re模块会比NSRegualarExpression的API更加好用。
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

## <a name="more_usage"></a>常用方法用例
### 创建可重复使用的正则表达式对象
```swift
let regex = re.compile("this(.+)that")
```
### 从字符串起始点开始匹配
```swift
if let m = regex.match("this one is different from that") {
	m.group()  //"this one is different from that"
	m.group(1) //" one is different from "
}
```
### 在字符串中搜索第一个匹配
```swift
if let m = regex.search("I want this one, not that one") {
	m.group()  //"this one, not that one"
	m.group(1) //" one, not "
}
```
### 查找所有匹配字串
```swift
regex.findall("this or that, this and that") // ["this or that", "this and that"]
```
### 获得所有匹配字串的匹配结果
```swift
for m in regex.finditer("this or that, this and that") {
	m.group()  // 第1次: "this or that", 第2次: "this and that"
	m.group(1) // 第1次: " or ", 第2次: " and "
}
```
### 用正则表达式分割字符串
```swift
let regex = re.compile("[\\+\\-\\*/]")

// 默认将做最多次分割
regex.split("1+2-3*4/5")    // ["1", "2", "3", "4", "5"]

// 设定最大分割次数为2
regex.split("1+2-3*4/5", 2) // ["1", "2", "3*4/5"]
```
### 正则替换
```swift
let regex = re.compile("[Yy]ou")

// 替换所有匹配 (本例中替换了2次)
regex.sub("u", "You guys go grap your food")     // "u guys go grap ur food"
regex.subn("u", "You guys go grap your food")    // ("u guys go grap ur food", 2)

// 设定最大替换次数 (本例中替换了1次)
regex.sub("u", "You guys go grap your food", 1)  // "u guys go grap your food"
regex.subn("u", "You guys go grap your food", 1) // ("u guys go grap your food", 1)
```

## 开源协议

`PySwiftyRegex` 使用MIT许可协议。 详见 [LICENSE](https://github.com/cezheng/PySwiftyRegex/blob/master/LICENSE) 。
