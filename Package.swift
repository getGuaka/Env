import PackageDescription

let package = Package(
    name: "Env",
    targets: [
      Target(name:"Env"),
    ],
    dependencies: [
      .Package(url: "https://github.com/oarrabi/Environ.git", majorVersion: 0)
    ]
)
