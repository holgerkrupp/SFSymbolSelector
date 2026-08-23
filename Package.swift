// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SFSymbolSelector",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "SFSymbolSelector", targets: ["SFSymbolSelector"])
    ],
    targets: [
        .target(name: "SFSymbolSelector")
    ]
)
