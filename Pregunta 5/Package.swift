// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Main",
    products: [
        .executable(name: "Main", targets: ["Main"])
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: []
        ),
        .testTarget(
            name: "MainTests",
            dependencies: ["Main"]
        )
    ]
)