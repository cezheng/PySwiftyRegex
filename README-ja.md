# PySwiftyRegex
Pythonのようなスッキリした正規表現ライブラリー。

[English](https://github.com/cezheng/PySwiftyRegex/blob/master/README.md)
[简体中文](https://github.com/cezheng/PySwiftyRegex/blob/master/README-zh.md)

## コードをみましょう

```swift
import PySwiftyRegex

if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
	m.group()  // "this is really easy"
	m.group(1) // "really "
}
```

## 環境

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 7.0

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

## インストール
> **Embedded frameworks を使うには iOS 8 または OS X Mavericks 以上は必要です**
>
> Deployment Target は iOS 7 のプロジェクトで `PySwiftyRegex` を使うには, [PySwiftyRegex.swift](https://github.com/cezheng/PySwiftyRegex/blob/master/PySwiftyRegex/PySwiftyRegex.swift) のソースファイルをダウンロードして、Xcodeプロジェクトに追加するのは必要となります。

### CocoaPods(iOS 8+, OS X 10.9+)
[Cocoapods](http://cocoapods.org/) で簡単に `PySwiftyRegex` をインストールできます。 下記のように`Podfile`を編集してください:

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'PySwiftyRegex', '~> 0.1.0'
end
```

そして、下記のコマンドを実行してください:

```bash
$ pod install
```

## ライセンス

`PySwiftyRegex` のオープンソースライセンスは MIT です。 詳しくはこちら [LICENSE](https://github.com/cezheng/PySwiftyRegex/blob/master/LICENSE) 。