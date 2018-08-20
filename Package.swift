// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Env",
    dependencies: [
        .package(url: "https://github.com/nsomar/Environ.git", from: "0.0.0")
    ],
    targets: [
        .target(name:"Env"),
        .testTarget(name:"EnvTests", dependencies: ["Env"]),
    ],
    swiftLanguageVersions: [4]
)
