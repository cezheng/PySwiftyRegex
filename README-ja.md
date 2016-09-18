# PySwiftyRegex
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PySwiftyRegex.svg)](https://cocoapods.org/pods/PySwiftyRegex)
[![License](https://img.shields.io/cocoapods/l/PySwiftyRegex.svg?style=flat&color=gray)](http://opensource.org/licenses/MIT)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/PySwiftyRegex.svg?style=flat)](http://cocoadocs.org/docsets/PySwiftyRegex)
[![Twitter](https://img.shields.io/badge/twitter-@AdamoCheng-blue.svg?style=flat)](http://twitter.com/AdamoCheng)

Pythonのようなスッキリした正規表現ライブラリー。

[English](README.md)
[简体中文](README-zh.md)
[한국어](README-ko.md)

## コードをみましょう

```swift
import PySwiftyRegex

if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
	m.group()  // "this is really easy"
	m.group(1) // "really "
}
```
よく使われるメッソドの用例は[こちら](#more_usage)。

## 環境

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 8.0+

> Swift 2.3はバージョン[0.3.0](../../releases/tag/0.3.0)をご利用ください。

## インストール
> **Embedded frameworks を使うには iOS 8 または OS X Mavericks 以上は必要です**
>
> Deployment Target は iOS 7 のプロジェクトで `PySwiftyRegex` を使うには, [PySwiftyRegex.swift](PySwiftyRegex/PySwiftyRegex.swift) のソースファイルをダウンロードして、Xcodeプロジェクトに追加するのは必要となります。

### CocoaPods(iOS 8+, OS X 10.9+)
[Cocoapods](http://cocoapods.org/) で簡単に `PySwiftyRegex` をインストールできます。 下記のように`Podfile`を編集してください:

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'PySwiftyRegex', '~> 1.0.0'
end
```

そして、下記のコマンドを実行してください:

```bash
$ pod install
```

### Carthage(iOS 8+, OS X 10.9+)
下記の行を `Cartfile` か `Cartfile.private` かに追加してください:

```
github "cezheng/PySwiftyRegex" ~> 1.0.0
```
そして、下記のコマンドを実行してください:

```
$ carthage update
```
最後に、ビルドターゲットの`General` -> `Embedded Binaries`に、Carthageがビルドした`PySwiftyRegex.framework`を追加してください。

## 対応したreメソッド
[**re**](https://docs.python.org/2/library/re.html) モデルを使ったことがあれば, すぐこのライブラリーをご利用できると思います。もしなかったら、下記のPythonドキュメントのリンクをご覧いただけると、このシンプルなモデルに一目惚れするかもしれませんw
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

## <a name="more_usage"></a>よく使われるメッソドの用例
### RegexObjectをコンパイルする
```swift
let regex = re.compile("this(.+)that")
```
### 文字列の始めからマッチングする
```swift
if let m = regex.match("this one is different from that") {
	m.group()  //"this one is different from that"
	m.group(1) //" one is different from "
}
```
### 文字列の中にパターンを探す (first match)
```swift
if let m = regex.search("I want this one, not that one") {
	m.group()  //"this one, not that one"
	m.group(1) //" one, not "
}
```
### マッチングできた全ての文字列を取得する
```swift
regex.findall("this or that, this and that") // ["this or that", "this and that"]
```
### マッチングできた全てのMatchObjectを取得する
```swift
for m in regex.finditer("this or that, this and that") {
	m.group()  // 1st time: "this or that", second time: "this and that"
	m.group(1) // 1st time: " or ", second time: " and "
}
```
### パターンで文字列を分割する
```swift
let regex = re.compile("[\\+\\-\\*/]")

// デフォルト、全て分割する
regex.split("1+2-3*4/5")    // ["1", "2", "3", "4", "5"]

// 最大分割回数 = 2
regex.split("1+2-3*4/5", 2) // ["1", "2", "3*4/5"]
```
### パターンで文字列を置換する
```swift
let regex = re.compile("[Yy]ou")

// 全て置換する (この例は2回)
regex.sub("u", "You guys go grap your food")     // "u guys go grap ur food"
regex.subn("u", "You guys go grap your food")    // ("u guys go grap ur food", 2)

// 最大置換回数を1回にする (この例は1回)
regex.sub("u", "You guys go grap your food", 1)  // "u guys go grap your food"
regex.subn("u", "You guys go grap your food", 1) // ("u guys go grap your food", 1)
```

## ライセンス

`PySwiftyRegex` のオープンソースライセンスは MIT です。 詳しくはこちら [LICENSE](LICENSE) 。
