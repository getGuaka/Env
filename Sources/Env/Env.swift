#if os(Linux)
  @_exported import Glibc
#else
  @_exported import Darwin.C
  @_exported import Darwin
#endif
import Environ


public enum Env {

  /// Return the list of all the enviromenment keys, vlues pairs passed to the script
  public static var items: [String: String] {

    var items: [String: String] = [:]
    guard var environCopy = Environ.environ else { return items }

    while true {
      let x = environCopy[0]
      guard let (key, value) = splitEnvironment(x) else { return items }
      items[key] = value

      environCopy = environCopy.advanced(by: 1)
    }
  }

  /// Return the list of all the enviromenment keys passed to the script
  public static var keys: [String] {
    return Array(items.keys)
  }

  /// Return the list of all the enviromenment values passed to the script
  public static var values: [String] {
    return Array(self.items.values)
  }

  /**
   Return the enviromenment for the provided key

   - parameter key: The enviromenment variable key

   - returns: The enviromenment variable value
   */
  public static func get(_ key: String) -> String? {
    guard let value = getenv(key) else { return nil }
    return String(cString: value)
  }

  /**
   Set a new value for the enviromenment variable

   - parameter key: The enviromenment variable key
   - parameter value: The enviromenment variable value
   */
  public static func set(_ key: String, _ value: String?) {
    if let newValue = value {
      setenv(key, newValue, 1)
    } else {
      unsetenv(key)
    }
  }


  /**
   Clear all the enviromenment variables
   */
  public static func clear() {
    self.keys
      .forEach{ self.set($0, nil) }
  }

  /**
   Check if the enviromenment variable key exists

   - parameter key: The enviromenment variable key

   - returns: true if exists false otherwise
   */
  public static func hasKey(_ key: String) -> Bool {
    return self.keys.contains { $0 == key }
  }


  /**
   Check if the enviromenment variable value exists

   - parameter key: The enviromenment variable value

   - returns: true if exists false otherwise
   */
  public static func hasValue(_ value: String) -> Bool {
    return self.values.contains(value)
  }

  /**
   Iterate through the list of enviromenment variables

   - parameter callback: callback to call on each key/value pair
   */
  public static func eachPair(_ callback: (_ key: String, _ value: String) -> ()) {
    zip(self.keys, self.values).forEach(callback)
  }

}


extension Env {

  fileprivate static func splitEnvironment(_ environment: UnsafePointer<Int8>?) -> (String, String)? {

    guard
      let environment = environment
      else { return nil }

    let environmentStr = String(cString: environment)

    guard
      let index = environmentStr.index(of: "=")
      else { return nil }

    let key = String(environmentStr[environmentStr.startIndex..<index])

    let advanced = environmentStr.index(after: index)
    let value = String(environmentStr[advanced..<environmentStr.endIndex])
    return (key, value)
  }

}
