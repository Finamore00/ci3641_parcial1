// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "BuddySystemFunc",
    products: [
        .library(name: "BuddySystemFunc", targets: ["BuddySystemFunc"])
    ],
    dependencies: [
        .package(name: "Block", path: "../Block")
    ],
    targets: [
        .target(
            name: "BuddySystemFunc",
            dependencies: [
                .byName(name: "Block")
            ]
        )
    ]
)