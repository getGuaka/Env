import Foundation
import XCTest
import Quick
import Nimble
@testable import ENV


class ENVTests2: XCTestCase {
  func testItReturnsNilWhenEnvISNotFound() {
    expect(Env.get("AAAAA"))
      .to(beNil())
  }
  
  func testItReadEnvVaes() {
    Env.set("SomeKey", "SomeValue")
    expect(Env.get("SomeKey")).to(equal("SomeValue"))
  }
  
  func testItClearsKeyWhenNillIsPassed() {
    Env.set("SomeKey", "SomeValue")
    expect(Env.get("SomeKey")).to(equal("SomeValue"))
    
    Env.set("SomeKey", nil)
    expect(Env.get("SomeKey")).to(beNil())
  }
  
  func testItClearsAllEnvVars() {
    Env.set("SomeKey", "SomeValue")
    expect(Env.get("SomeKey")).to(equal("SomeValue"))
    
    Env.clear()
    XCTAssertNil(Env.get("SomeKey"))
  }
  
  func testItReturnsAllKeys() {
    Env.clear()
    Env.set("key1", "value1")
    Env.set("key2", "value2")
    
    expect(Env.keys.contains("key1")).to(beTrue())
    expect(Env.keys.contains("key2")).to(beTrue())
   
    Env.clear()
    
    XCTAssertEqual(Env.keys.count, 0)
  }
  
  func testItReturnsAllValues() {
    Env.clear()
    Env.set("key1", "value1")
    Env.set("key2", "value2")
    
    expect(Env.keys.contains("key1")).to(beTrue())
    expect(Env.keys.contains("key2")).to(beTrue())
  }
  
  func testItChecksIfKeyExists() {
    Env.set("key1", "value1")
    expect(Env.hasKey("key1")).to(beTrue())
    
    Env.clear()
    expect(Env.hasKey("key1")).to(beFalse())
  }
  
  func testItChecksIfValueExists() {
    Env.set("key1", "value1")
    expect(Env.hasValue("value1")).to(beTrue())
    
    Env.clear()
    expect(Env.hasValue("value1")).to(beFalse())
  }
  
  func testItEnumerateKeysAndValues() {
    Env.clear()
    Env.set("key1", "value1")
    Env.set("key2", "value2")
    
    Env.eachPair {
      expect(["key1", "key2"]).to(contain($0))
      expect(["value1", "value2"]).to(contain($1))
    }
  }
}
