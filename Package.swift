// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpotifyEquilizerView",
    platforms: [
            .iOS(.v17) // 👈 Set minimum iOS version to 13
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SpotifyEquilizerView",
            targets: ["SpotifyEquilizerView"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SpotifyEquilizerView"),
        .testTarget(
            name: "SpotifyEquilizerViewTests",
            dependencies: ["SpotifyEquilizerView"]),
    ]
)
