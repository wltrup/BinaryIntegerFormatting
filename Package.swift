// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryIntegerFormatting",
    platforms: [
        .iOS(.v10),
        .watchOS(.v4),
        .tvOS(.v10),
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "BinaryIntegerFormatting",
            targets: ["BinaryIntegerFormatting"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wltrup/CollectionSplitting.git", from: "0.1.0"),
        .package(url: "https://github.com/wltrup/StringFormatting.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "BinaryIntegerFormatting",
            dependencies: [
                "CollectionSplitting",
                "StringFormatting",
            ]
        ),
        .testTarget(
            name: "BinaryIntegerFormattingTests",
            dependencies: ["BinaryIntegerFormatting"]
        ),
    ]
)
