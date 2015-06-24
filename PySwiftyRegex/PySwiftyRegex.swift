// PySwiftyRegex.swift
// Copyright (c) 2015 Ce Zheng
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

public class re {
  public static func compile(pattern: String, flags: [RegexPython.Flag] = []) throws -> RegexPython  {
    return try RegexPython(pattern: pattern, flags: flags)
  }
  
  public static func match(pattern: String, string: String, flags: [RegexPython.Flag] = []) throws -> MatchObjectPython? {
    return try re.compile(pattern, flags: flags).match(string)
  }
  
  public static func search(pattern: String, string: String, flags: [RegexPython.Flag] = []) throws -> MatchObjectPython? {
    return try re.compile(pattern, flags: flags).search(string)
  }
  
  public static func finditer(pattern: String, string: String, flags: [RegexPython.Flag] = []) throws -> [MatchObjectPython] {
    return try re.compile(pattern, flags: flags).finditer(string)
  }
  
  public static func findall(pattern: String, string: String, flags: [RegexPython.Flag] = []) throws -> [String] {
    return try re.compile(pattern, flags: flags).findall(string)
  }
  
  public static func split(pattern: String, string: String, maxsplit: Int = 0, flags: [RegexPython.Flag] = []) throws -> [String] {
    return try re.compile(pattern, flags: flags).split(string, maxsplit: maxsplit)
  }
}

public struct MatchObjectPython {
  public let string: String
  public let match: NSTextCheckingResult?
  
  init(string: String, match: NSTextCheckingResult?) {
    self.string = string
    self.match = match
  }
  
  public func group(index: Int = 0) -> String? {
    guard let range = span(index) else {
      return nil
    }
    if range.startIndex == string.endIndex {
      return nil
    }
    return string.substringWithRange(range)
  }
  
  public func group(indexes: Int...) -> [String?] {
    return indexes.map({self.group($0)})
  }
  
  public func groups(defaultValue: String) -> [String] {
    guard let match = match else {
      return []
    }
    return (1..<match.numberOfRanges).map({
      if let string: String = self.group($0) {
        return string
      }
      return defaultValue
    })
  }
  
  public func groups() -> [String?] {
    guard let match = match else {
      return []
    }
    return (1..<match.numberOfRanges).map({self.group($0)})
  }
  
  public func span(index: Int = 0) -> Range<String.Index>? {
    guard let match = match else {
      return nil
    }
    if index >= match.numberOfRanges {
      return nil
    }
    let range = match.rangeAtIndex(index)
    
    if range.location == NSNotFound {
      return string.endIndex..<string.endIndex
    }
    
    let startIndex = advance(string.startIndex, range.location)
    let endIndex = advance(startIndex, range.length)
    return startIndex..<endIndex
  }
  
  public func expand(template: String) -> String {
    guard let match = self.match else {
      return ""
    }
    guard let regex = match.regularExpression else {
      return ""
    }
    return regex.replacementStringForResult(match, inString: self.string, offset: 0, template: template)
  }
}

public struct RegexPython {
  public typealias Flag = NSRegularExpressionOptions
  public typealias MatchObject = MatchObjectPython
  
  public let pattern: String
  private let regex: NSRegularExpression
  
  public var nsRegex: NSRegularExpression {
    return self.regex
  }
  
  public var flags: Flag {
    return self.regex.options
  }
  
  public var groups: Int {
    return self.regex.numberOfCaptureGroups
  }
  
  init(pattern: String, flags: [Flag] = []) throws {
    self.pattern = pattern
    let options = Flag(rawValue: flags.reduce(0) {$0 | $1.rawValue})
    self.regex = try NSRegularExpression(pattern: pattern, options: options)
  }
  
  public func search(string: String, pos: UInt = 0, endpos: UInt? = nil, options: [NSMatchingOptions] = []) -> MatchObject? {
    let start = Int(pos)
    let end = endpos == nil ? Int(string.characters.count) : Int(endpos!)
    let length = max(0, end - start)
    let range = NSRange(location: start, length: length)
    let options = NSMatchingOptions(rawValue: options.reduce(0) {$0 | $1.rawValue})
    let match = self.regex.firstMatchInString(string, options: options, range: range)
    if let match = match {
      return MatchObject(string: string, match: match)
    }
    return nil
  }
  
  public func match(string: String, pos: UInt = 0, endpos: UInt? = nil) -> MatchObject? {
    return search(string, pos: pos, endpos: endpos, options: [.Anchored])
  }
  
  public func finditer(string: String, pos: UInt = 0, endpos: UInt? = nil) -> [MatchObject] {
    let start = Int(pos)
    let end = endpos == nil ? Int(string.characters.count) : Int(endpos!)
    let length = max(0, end - start)
    let range = NSRange(location: start, length: length)
    let options = NSMatchingOptions(rawValue: 0)
    var matches = [NSTextCheckingResult]()
    self.regex.enumerateMatchesInString(string, options: options, range: range) {
      (result: NSTextCheckingResult?, flags: NSMatchingFlags, ptr: UnsafeMutablePointer<ObjCBool>) in
      if let result = result {
        matches.append(result)
      }
    }
    return matches.map({MatchObject(string: string, match: $0)})
  }
  
  public func findall(string: String, pos: UInt = 0, endpos: UInt? = nil) -> [String] {
    return finditer(string, pos: pos, endpos: endpos).map({$0.group()!})
  }
  
  public func split(string: String, maxsplit: Int = 0) -> [String] {
    var splitsLeft = maxsplit == 0 ? Int.max : (maxsplit < 0 ? 0 : maxsplit)
    let options = NSMatchingOptions(rawValue: 0)
    let range = NSRange(location: 0, length: string.characters.count)
    var results = [String]()
    var start = string.startIndex
    var end = string.startIndex
    self.regex.enumerateMatchesInString(string, options: options, range: range) {
      (result: NSTextCheckingResult?, flags: NSMatchingFlags, ptr: UnsafeMutablePointer<ObjCBool>) in
      if splitsLeft <= 0 {
        return
      }
      let length: Int
      if let result = result {
        end = advance(string.startIndex, result.range.location)
        length = result.range.length
      } else {
        end = string.endIndex
        length = 0
      }
      results.append(string.substringWithRange(start..<end))
      splitsLeft--
      start = advance(end, length)
    }
    if start >= end {
      results.append(string.substringWithRange(start..<string.endIndex))
    }
    return results
  }
  
  public func sub(repl repl: String, string: String, count: Int = 0) -> String {
    return subn(repl: repl, string: string, count: count).0
  }
  
  public func subn(repl repl: String, string: String, count: Int = 0) -> (String, Int) {
    let options = NSMatchingOptions(rawValue: 0)
    let range = NSRange(location: 0, length: string.characters.count)
    let mutable = NSMutableString(string: string)
    let maxCount = count == 0 ? Int.max : (count > 0 ? count : 0)
    var n = 0
    var offset = 0
    self.regex.enumerateMatchesInString(string, options: options, range: range) {
      (result: NSTextCheckingResult?, flags: NSMatchingFlags, ptr: UnsafeMutablePointer<ObjCBool>) in
      if maxCount - n <= 0 {
        return
      }
      if let result = result {
        n++
        let resultRange = NSRange(location: result.range.location + offset, length: result.range.length)
        let lengthBeforeReplace = mutable.length
        self.regex.replaceMatchesInString(mutable, options: options, range: resultRange, withTemplate: repl)
        offset += mutable.length - lengthBeforeReplace
      }
    }
    return (mutable as String, n)
  }
}



