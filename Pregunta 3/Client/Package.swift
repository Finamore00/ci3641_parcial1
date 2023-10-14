// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "BuddySystemClient",
    products: [
        .executable(name: "BuddySystem", targets: ["BuddySystemClient"])
    ],
    dependencies: [
        .package(name: "Block", path: "../Block"),
        .package(name: "BuddySystemFunc", path: "../Functions")
    ],
    targets: [
        .executableTarget(
            name: "BuddySystemClient",
            dependencies: [
                .byName(name: "Block"),
                .byName(name: "BuddySystemFunc")
            ]
        )
    ]
)