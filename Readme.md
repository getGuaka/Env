# Env

[![Build Status](https://travis-ci.com/getGuaka/Env.svg?branch=master)](https://travis-ci.com/getGuaka/Env)
[![codecov](https://codecov.io/gh/getGuaka/Env/branch/master/graph/badge.svg)](https://codecov.io/gh/getGuaka/Env)
[![Platform](https://img.shields.io/badge/platform-osx-lightgrey.svg)](https://travis-ci.com/getGuaka/Env)
[![Language: Swift](https://img.shields.io/badge/language-swift-orange.svg)](https://travis-ci.com/getGuaka/Env)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


## Why?

If you are developing cross platform command line apps, you need an easy way to interact with the environment variables. `Env` provides just that.

You can use `Env` with [Guaka](https://github.com/nsomar/Guaka) to create aweseome command line applications.

## Usage

```swift
// Set an enviroment variable
Env.set("key1", "value1")

// Get an environment variable
Env.get("SomeKey")

// Clear all variables
Env.clear()

// Get all keys and values
Env.keys()
Env.values()
```

## Installation
You can install Env using Swift Package Manager (SPM) or Carthage.

### Swift Package Manager
Add Env as dependency in your `Package.swift`.

```swift
import PackageDescription

let package = Package(name: "YourPackage",
    dependencies: [
        .package(url: "https://github.com/getGuaka/Env.git", from: "0.0.0"),
    ]
)
```

### Carthage
    github "getGuaka/Env"

## Tests
Tests can be found [here](https://github.com/getGuaka/Env/tree/master/Tests).

Run them with
```
swift test
```

## Contributing

Just send a PR! We don't bite ;)
