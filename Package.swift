import PackageDescription

let package = Package(
    name: "Env",
    targets: [
      Target(name:"Environ"),
      Target(name:"Env", dependencies: ["Environ"]),
    ]
)
