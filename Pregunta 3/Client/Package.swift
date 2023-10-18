// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "BuddySystemClient",
    products: [
        .executable(name: "BuddySystem", targets: ["BuddySystemClient"])
    ],
    dependencies: [
        .package(name: "Structs", path: "../Structs"),
        .package(name: "BuddySystemFunc", path: "../Functions")
    ],
    targets: [
        .executableTarget(
            name: "BuddySystemClient",
            dependencies: [
                .byName(name: "Structs"),
                .byName(name: "BuddySystemFunc")
            ]
        ),
        .testTarget(
            name: "BuddySystemTests",
            dependencies: [
                .byName(name: "Structs")
            ]
        )
    ]
)