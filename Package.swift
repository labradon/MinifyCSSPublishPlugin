// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MinifyCSSPublishPlugin",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "MinifyCSSPublishPlugin",
            targets: ["MinifyCSSPublishPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "MinifyCSSPublishPlugin",
            dependencies: [.product(name: "Publish", package: "publish")]),
        .testTarget(
            name: "MinifyCSSPublishPluginTests",
            dependencies: ["MinifyCSSPublishPlugin"]),
    ]
)
