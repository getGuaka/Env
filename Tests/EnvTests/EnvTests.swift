import Foundation
import XCTest
@testable import Env


class EnvTests: XCTestCase {
  func testItReturnsNilWhenEnvISNotFound() {
    XCTAssertNil(Env.get("AAAAA"))
  }

  func testItReadEnvVaes() {
    Env.set("SomeKey", "SomeValue")
    XCTAssertEqual(Env.get("SomeKey"), "SomeValue")
  }

  func testItClearsKeyWhenNillIsPassed() {
    Env.set("SomeKey", "SomeValue")
    XCTAssertEqual(Env.get("SomeKey"), "SomeValue")

    Env.set("SomeKey", nil)
    XCTAssertEqual(Env.get("SomeKey"), nil)
  }

  func testItClearsAllEnvVars() {
    Env.set("SomeKey", "SomeValue")
    XCTAssertEqual(Env.get("SomeKey"), "SomeValue")

    Env.clear()
    XCTAssertEqual(Env.get("SomeKey"), nil)
  }

  func testItReturnsAllKeys() {
    Env.clear()
    Env.set("key1", "value1")
    Env.set("key2", "value2")

    XCTAssertTrue(Env.keys.contains("key1"))
    XCTAssertTrue(Env.keys.contains("key2"))

    Env.clear()

    XCTAssertEqual(Env.keys.count, 0)
  }

  func testItReturnsAllValues() {
    Env.clear()
    Env.set("key1", "value1")
    Env.set("key2", "value2")

    XCTAssertTrue(Env.keys.contains("key1"))
    XCTAssertTrue(Env.keys.contains("key2"))
  }

  func testItChecksIfKeyExists() {
    Env.set("key1", "value1")
    XCTAssertTrue(Env.hasKey("key1"))

    Env.clear()
    XCTAssertFalse(Env.hasKey("key1"))
  }

  func testItChecksIfValueExists() {
    Env.set("key1", "value1")
    XCTAssertTrue(Env.hasValue("value1"))

    Env.clear()
    XCTAssertFalse(Env.hasValue("value1"))
  }

  func testItEnumerateKeysAndValues() {
    Env.clear()
    Env.set("key1", "value1")
    Env.set("key2", "value2")

    Env.eachPair {
      XCTAssertTrue(["key1", "key2"].contains($0))
      XCTAssertTrue(["value1", "value2"].contains($1))
    }
  }

  static var allTests : [(String, (EnvTests) -> () throws -> Void)] {
    return [
      ("testItReturnsNilWhenEnvISNotFound", testItReturnsNilWhenEnvISNotFound),
      ("testItReadEnvVaes", testItReadEnvVaes),
      ("testItClearsKeyWhenNillIsPassed", testItClearsKeyWhenNillIsPassed),
      ("testItClearsAllEnvVars", testItClearsAllEnvVars),
      ("testItReturnsAllKeys", testItReturnsAllKeys),
      ("testItReturnsAllValues", testItReturnsAllValues),
      ("testItChecksIfKeyExists", testItChecksIfKeyExists),
      ("testItChecksIfValueExists", testItChecksIfValueExists),
      ("testItEnumerateKeysAndValues", testItEnumerateKeysAndValues),
    ]
  }
}
