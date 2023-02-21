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
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "MinifyCSSPublishPlugin",
            dependencies: ["Publish"]),
        .testTarget(
            name: "MinifyCSSPublishPluginTests",
            dependencies: ["MinifyCSSPublishPlugin"]),
    ]
)
