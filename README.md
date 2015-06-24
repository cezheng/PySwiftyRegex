# PySwiftyRegex
============
PySwiftyRegex is a wrapper for Swift that makes dealing with regular expressions as if you are doing it in Python, relieving your pain of dealing with the cumbersome NSRegularExpression.

Example:

```
// With PySwiftyRegex in Swift
do {
	let m = try re.match("Hello, (\w+)!(\d+)?", "Hello, PySwiftyRegex!!!!")
	m.group()       // "Hello, PySwiftyRegex!"
	m.group(0)      // "Hello, PySwiftyRegex!"
	m.group(1)      // "PySwiftRegex"
	m.group(2)      // nil
	m.groups()      // ["PySwiftyRegex", nil]
	m.groups("0")   // ["PySwiftyRegex", "0"]
	m.span()        // 0..<21 as Range<String.Index>
	m.span(0)       // 0..<21 as Range<String.Index>
	m.span(1)       // 7..<21 as Range<String.Index>
	m.span(2)       // endIndex..<endIndex as Range<String.Index>
	m.expand("$1~") // "PySwiftyRegex~"
}
```

```
// In Python
let m = re.match("Hello, (\w+)!(\d+)?", "Hello, PySwiftyRegex!!!!")
m.group()       // "Hello, PySwiftyRegex!"
m.group(0)      // "Hello, PySwiftyRegex!"
m.group(1)      // "PySwiftRegex"
m.group(2)      // None
m.groups()      // ["PySwiftyRegex", None]
m.groups("0")   // ["PySwiftyRegex", "0"]
m.span()        // (0, 21)
m.span(0)       // (0, 21)
m.span(1)       // (7, 21)
m.span(2)       // (-1, -1)
m.expand(r"\1~") // "PySwiftyRegex~"
```

## Requirements

- iOS 7.0+ / Mac OS X 10.9+
- Xcode 7.0


## TODO

* Write Doc in source file
* Finish writing this README
	* List all the differences with real python
	* Add example usage for all supported methods
* CocoaPod & Carthage support
* Add more test cases