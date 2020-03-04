// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Hardware",
    products: [
        .library(
            name: "Hardware",
            targets: ["Hardware"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Hardware",
            dependencies: []),
        .testTarget(
            name: "HardwareTests",
            dependencies: ["Hardware"]),
    ]
)
