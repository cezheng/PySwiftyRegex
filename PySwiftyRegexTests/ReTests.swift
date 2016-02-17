// ReTests.swift
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

import XCTest
import PySwiftyRegex

class ReTests: XCTestCase {
  func testCompileValidRegex() {
    let regex = re.compile("(\\W+)", flags: [.AllowCommentsAndWhitespace, .AnchorsMatchLines])
    XCTAssertTrue(regex.isValid)
    XCTAssertEqual(regex.flags, NSRegularExpressionOptions.AllowCommentsAndWhitespace.union(.AnchorsMatchLines))
    XCTAssertEqual(regex.pattern, "(\\W+)")
    XCTAssertEqual(regex.nsRegex!, try! NSRegularExpression(pattern: "(\\W+)", options: NSRegularExpressionOptions.AllowCommentsAndWhitespace.union(.AnchorsMatchLines)))
    XCTAssertEqual(regex.groups, 1)
    
  }
  
  func testCompileInvalidRegex() {
    let regex = re.compile("(\\W+", flags: [.AllowCommentsAndWhitespace, .AnchorsMatchLines])
    XCTAssertFalse(regex.isValid)
    XCTAssertEqual(regex.flags, NSRegularExpressionOptions(rawValue: 0))
    XCTAssertEqual(regex.pattern, "(\\W+")
    XCTAssertNil(regex.nsRegex)
    XCTAssertEqual(regex.groups, 0)
  }
  
  func testSearch() {
    AssertEqual(re.search("a", "ssa")!.groups(),[])
    AssertEqual(re.search("(a)", "ssa")!.groups(), ["a"])
    XCTAssertEqual(re.search("(a)", "ssa")!.group(0), "a")
    XCTAssertEqual(re.search("(a)", "ssa")!.group(1), "a")
    AssertEqual(re.search("(a)", "ssa")!.group([1, 1]), ["a", "a"])
  }
  
  func testMatch() {
    AssertEqual(re.match("a", "a")!.groups(), [])
    AssertEqual(re.match("(a)", "a")!.groups(), ["a"])
    XCTAssertEqual(re.match("(a)", "a")!.group(0), "a")
    XCTAssertEqual(re.match("(a)", "a")!.group(1), "a")
    AssertEqual(re.match("(a)", "a")!.group([1, 1]), ["a", "a"])
  }
  
  func testSplit() {
    AssertEqual(re.split(":", ":a:b::c"), ["", "a", "b", "", "c"])
    AssertEqual(re.split(":*", ":a:b::c").map{$0!}, ["", "a", "b", "c"])
    AssertEqual(re.split("(:*)", ":a:b::c"), ["", ":", "a", ":", "b", "::", "c"])
    AssertEqual(re.split("(?::*)", ":a:b::c"), ["", "a", "b", "c"])
    AssertEqual(re.split("(:)*", ":a:b::c"), ["", ":", "a", ":", "b", ":", "c"])
    AssertEqual(re.split("([b:]+)", ":a:b::c"), ["", ":", "a", ":b::", "c"])
    AssertEqual(re.split("(b)|(:+)", ":a:b::c"), ["", nil, ":", "a", nil, ":", "", "b", nil, "", nil, "::", "c"])
    AssertEqual(re.split("(?:b)|(?::+)", ":a:b::c"), ["", "a", "", "", "c"])
  }
  
  func testFindAll() {
    XCTAssertEqual(re.findall(":+", "abc"), [])
    XCTAssertEqual(re.findall(":+", "a:b::c:::d"), [":", "::", ":::"])
    XCTAssertEqual(re.findall("(:+)", "a:b::c:::d"), [":", "::", ":::"])
    XCTAssertEqual(re.findall("(:)(:*)", "a:b::c:::d"), [":", "::", ":::"])
  }
  
  func testFindIter() {
    let m = re.finditer(":+", "a:b::c:::d")
    XCTAssertEqual(m.map{$0.group(0)!}, [":", "::", ":::"])
  }
  
  func testSub() {
    XCTAssertEqual(re.sub("(?i)b+", "x", "bbbb BBBB"), "x x")
    XCTAssertEqual(re.sub("x", "\\\\N{LATIN CAPITAL LETTER A}",
      "x"), "\\N{LATIN CAPITAL LETTER A}")
    XCTAssertEqual(re.sub(".", "\n", "x"), "\n")
  }
  
  func testSubN() {
    AssertEqual(re.subn("(?i)b+", "x", "bbbb BBBB"), ("x x", 2))
    AssertEqual(re.subn("b+", "x", "bbbb BBBB"), ("x BBBB", 1))
    AssertEqual(re.subn("b+", "x", "xyz"), ("xyz", 0))
    AssertEqual(re.subn("b*", "x", "xyz"), ("xxxyxzx", 4))
    AssertEqual(re.subn("b*", "x", "xyz", 2), ("xxxyz", 2))
  }
  
}
