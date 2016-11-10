import PackageDescription

let package = Package(
    name: "ENV",
    targets: [
      Target(name:"Environ"),
      Target(name:"ENV", dependencies: ["Environ"]),
    ]
)
