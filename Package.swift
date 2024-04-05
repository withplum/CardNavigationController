// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CardNavigationController",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "CardNavigationController",
            targets: ["CardNavigationController"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1")
    ],
    targets: [
        .target(
            name: "CardNavigationController",
            dependencies: ["SnapKit"],
            path: "CardNavigationController"),
        .testTarget(
            name: "Tests",
            dependencies: ["CardNavigationController"],
            path: "Tests"),
    ]
)
