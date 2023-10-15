// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Structs",
    products: [
        .library(name: "Structs", targets: ["Structs"])
    ],
    targets: [
        .target(
            name: "Structs",
            dependencies: []
        ),
        .testTarget(
            name: "StructsTests",
            dependencies: ["Structs"]
        )
    ]
)