// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let name: String = "TonSdkSwift"

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/nerzh/swift-regular-expression", .upToNextMajor(from: "0.2.3")),
    .package(url: "https://github.com/bytehubio/BigInt", .upToNextMinor(from: "5.4.0")),
    .package(url: "https://github.com/nerzh/swift-extensions-pack", .upToNextMajor(from: "1.27.2")),
    .package(url: "https://github.com/apple/swift-crypto", "1.0.0" ..< "3.0.0"),
    .package(url: "https://github.com/bytehubio/CryptoSwift", from: "1.4.2"),
    .package(url: "https://github.com/nerzh/swift-net-layer", .upToNextMajor(from: "1.5.0")),
]

var mainTarget: [Target.Dependency] = [
    .product(name: "SwiftRegularExpression", package: "swift-regular-expression"),
    .product(name: "SwiftExtensionsPack", package: "swift-extensions-pack"),
    .product(name: "BigInt", package: "BigInt"),
    .product(name: "Crypto", package: "swift-crypto"),
    .product(name: "CryptoSwift", package: "CryptoSwift"),
    .product(name: "SwiftNetLayer", package: "swift-net-layer"),
]

var testTarget: [Target.Dependency] = mainTarget + [
    .init(stringLiteral: name)
]

let package = Package(
    name: name,
    platforms: [
        .macOS(.v13),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: name,
            targets: [name]),
    ],
    dependencies: packageDependencies,
    targets: [
        .target(
            name: name,
            dependencies: mainTarget
        ),
        .testTarget(
            name: "\(name)Tests",
            dependencies: testTarget
        ),
    ]
)


