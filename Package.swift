// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FakeStoreAuthentication",
    platforms: [.iOS(.v17), .macOS(.v14), .watchOS(.v7)],
    products: [
        .library(
            name: "FakeStoreAuthentication",
            targets: ["FakeStoreAuthentication"]),
    ],
    dependencies: [
        .package(url: "https://github.com/andresduke024/swift-dependency-injector", .upToNextMinor(from: "1.4.0")),
        .package(url: "https://github.com/andresduke024/FakeStoreCommons",  .upToNextMinor(from: "1.0.0")),
    ],
    targets: [        .target(
            name: "FakeStoreAuthentication",
            dependencies: [
                .product(name: "SwiftDependencyInjector", package: "swift-dependency-injector"),
                .product(name: "FakeStoreCommons", package: "FakeStoreCommons"),
            ]
        ),
        .testTarget(
            name: "FakeStoreAuthenticationTests",
            dependencies: [
                "FakeStoreAuthentication",
                .product(name: "SwiftDependencyInjector", package: "swift-dependency-injector"),
                .product(name: "FakeStoreCommons", package: "FakeStoreCommons"),
            ]
        ),
    ]
)
