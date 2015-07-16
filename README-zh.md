# PySwiftyRegex
像Python一样简洁高效地作正则处理。

[English](https://github.com/cezheng/PySwiftyRegex/blob/master/README.md)

## 先上代码

```swift
import PySwiftyRegex

if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
	m.group()  // "this is really easy"
	m.group(1) // "really "
}
```

## 环境

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 7.0

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
	pod 'PySwiftyRegex', '~> 0.1.0'
end
```

配置好Podfile后执行如下命令:

```bash
$ pod install
```

## 开源协议

`PySwiftyRegex` 使用MIT许可协议。 详见 [LICENSE](https://github.com/cezheng/PySwiftyRegex/blob/master/LICENSE) 。