// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Block",
    products: [
        .library(name: "Block", targets: ["Block"])
    ],
    targets: [
        .target(
            name: "Block",
            dependencies: []
        ),
        .testTarget(
            name: "BlockTests",
            dependencies: ["Block"]
        )
    ]
)