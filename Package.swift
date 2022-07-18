// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Hardware",
    
    products: [
        .library(
            name: "Hardware",
            targets: ["Hardware"]
        ),
    ],
    
    dependencies: [
        
        // development tools
        .package(url: "https://github.com/elegantchaos/ActionBuilderPlugin.git", from: "1.0.0"),
        .package(url: "https://github.com/elegantchaos/SwiftFormatterPlugin.git", from: "1.0.3"),
    ],
    
    targets: [
        .target(
            name: "Hardware",
            dependencies: []
        ),
        
        .testTarget(
            name: "HardwareTests",
            dependencies: ["Hardware"]
        ),
    ]
)
