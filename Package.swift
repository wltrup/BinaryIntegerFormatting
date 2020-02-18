// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryIntegerFormatting",
    products: [
        .library(
            name: "BinaryIntegerFormatting",
            targets: ["BinaryIntegerFormatting"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BinaryIntegerFormatting",
            dependencies: []),
        .testTarget(
            name: "BinaryIntegerFormattingTests",
            dependencies: ["BinaryIntegerFormatting"]),
    ]
)
