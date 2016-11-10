import PackageDescription

let package = Package(
    name: "ENV",
    targets: [
      Target(name:"Environ"),
      Target(name:"ENV", dependencies: ["Environ"]),
    ],
    dependencies: [
      .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 0),
    ]
)
