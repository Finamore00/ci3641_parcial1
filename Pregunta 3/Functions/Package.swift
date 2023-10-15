// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "BuddySystemFunc",
    products: [
        .library(name: "BuddySystemFunc", targets: ["BuddySystemFunc"])
    ],
    dependencies: [
        .package(name: "Structs", path: "../Structs")
    ],
    targets: [
        .target(
            name: "BuddySystemFunc",
            dependencies: [
                .byName(name: "Structs")
            ]
        )
    ]
)