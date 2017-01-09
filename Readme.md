# Env

[![Build Status](https://travis-ci.org/oarrabi/Env.svg?branch=master)](https://travis-ci.org/oarrabi/Env)
[![codecov](https://codecov.io/gh/oarrabi/Env/branch/master/graph/badge.svg)](https://codecov.io/gh/oarrabi/Env)
[![Platform](https://img.shields.io/badge/platform-osx-lightgrey.svg)](https://travis-ci.org/oarrabi/Env)
[![Language: Swift](https://img.shields.io/badge/language-swift-orange.svg)](https://travis-ci.org/oarrabi/Env)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


## Why?

If you are developing cross platform command line apps, you need an easy way to interact with the Environment variables. `Env` provides just that.

You can use `Env` with [Guaka](https://github.com/oarrabi/Env) to create aweseome command line applications.

## Usage

```swift
// Set enviroment variable
Env.set("key1", "value1")

// Get environment variable
Env.get("SomeKey")

// Clear all variables
Env.clear()

// Get all keys and values
Env.keys()
Env.values()
```

## Installation
You can install Env using Swift package manager (SPM) and carthage

### Swift Package Manager
Add Env as dependency in your `Package.swift`

```
  import PackageDescription

  let package = Package(name: "YourPackage",
    dependencies: [
      .Package(url: "https://github.com/oarrabi/Env.git", majorVersion: 0),
    ]
  )
```

### Carthage
    github 'oarrabi/Env'

## Tests
Tests can be found [here](https://github.com/oarrabi/Env/tree/master/Tests).

Run them with
```
swift test
```

## Contributing

Just send a PR! We don't bite ;)
