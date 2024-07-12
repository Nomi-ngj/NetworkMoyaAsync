// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkMoyaAsync",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkMoyaAsync",
            targets: ["NetworkMoyaAsync"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Moya/Moya.git", from: "15.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NetworkMoyaAsync",
            dependencies: [
                .product(name: "Moya", package: "Moya")
            ]),
        .testTarget(
            name: "NetworkMoyaAsyncTests",
            dependencies: ["NetworkMoyaAsync"]),
    ]
)
